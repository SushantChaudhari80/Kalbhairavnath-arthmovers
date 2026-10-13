
package com.sushant.live.scheduler;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.time.LocalDate;
import java.time.YearMonth;
import java.time.format.DateTimeFormatter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sushant.live.model.DriverLeave;
import com.sushant.live.model.DriverLeave.LeaveStatus;
import com.sushant.live.model.DriverPayment;
import com.sushant.live.model.VehicaleDriver;
import com.sushant.live.repository.DriverLeaveRepository;
import com.sushant.live.repository.DriverPaymentRepository;
import com.sushant.live.repository.DriverRepository;
import com.sushant.live.util.SessionManager;

@Service
public class DriverPaymentSchedulerService {

    private static final DateTimeFormatter DATE_FORMATTER =
            DateTimeFormatter.ofPattern("dd/MM/yyyy");

    private final DriverPaymentRepository paymentRepository;
    private final DriverRepository driverRepository;
    private final DriverLeaveRepository leaveRepository;

    public DriverPaymentSchedulerService(
            DriverPaymentRepository paymentRepository,
            DriverRepository driverRepository,
            DriverLeaveRepository leaveRepository) {

        this.paymentRepository = paymentRepository;
        this.driverRepository = driverRepository;
        this.leaveRepository = leaveRepository;
    }

    /**
     * Credits net monthly salary after approved leave deductions.
     * Runs at 11:59 PM on the last day of every month.
     */
    @Scheduled(cron = "0 59 23 L * *")
    @Transactional
    public void creditSalary() {

        YearMonth salaryMonth = YearMonth.now();
        LocalDate monthStart = salaryMonth.atDay(1);
        LocalDate monthEnd = salaryMonth.atEndOfMonth();

        String salaryDate =
                LocalDate.now().format(DATE_FORMATTER);

        String monthLabel = salaryMonth.toString();

        // IMPORTANT: Scheduled jobs should not depend on a logged-in session.
        // Replace this with a query that retrieves drivers for all owners,
        // or invoke this job separately for each owner from the database.
        String ownerMobile =
                SessionManager.getInstance().getUsername();

        if (ownerMobile == null || ownerMobile.isBlank()) {
            throw new IllegalStateException(
                    "Cannot credit salary: owner context is unavailable");
        }

        List<VehicaleDriver> drivers =
                driverRepository.findAllByOwnerMobile(ownerMobile);

        int count = 0;

        for (VehicaleDriver driver : drivers) {

            BigDecimal monthlySalary = new BigDecimal(
                    String.valueOf(driver.getDriverSalary()));

            if (monthlySalary.signum() < 0) {
                throw new IllegalStateException(
                        "Negative salary configured for driver: "
                                + driver.getDriverName());
            }

            List<DriverLeave> approvedLeaves =
                    leaveRepository
                        .findByDriverNameIgnoreCaseAndStatusAndFromDateLessThanEqualAndToDateGreaterThanEqual(
                                driver.getDriverName(),
                                LeaveStatus.APPROVED,
                                monthEnd,
                                monthStart);

            // Use a set so overlapping approved requests do not deduct
            // the same calendar date more than once.
            Set<LocalDate> leaveDays = new HashSet<>();

            for (DriverLeave leave : approvedLeaves) {

                LocalDate start = leave.getFromDate().isBefore(monthStart)
                        ? monthStart : leave.getFromDate();

                LocalDate end = leave.getToDate().isAfter(monthEnd)
                        ? monthEnd : leave.getToDate();

                for (LocalDate date = start;
                     !date.isAfter(end);
                     date = date.plusDays(1)) {

                    // Sundays and all other calendar days are included.
                    leaveDays.add(date);
                }
            }

            int totalDaysInMonth = salaryMonth.lengthOfMonth();

            BigDecimal dailySalary = monthlySalary.divide(
                    BigDecimal.valueOf(totalDaysInMonth),
                    10,
                    RoundingMode.HALF_UP);

            BigDecimal deduction = dailySalary
                    .multiply(BigDecimal.valueOf(leaveDays.size()))
                    .setScale(2, RoundingMode.HALF_UP);

            // Never credit a negative salary.
            if (deduction.compareTo(monthlySalary) > 0) {
                deduction = monthlySalary;
            }

            BigDecimal netSalary = monthlySalary
                    .subtract(deduction)
                    .setScale(2, RoundingMode.HALF_UP);

            DriverPayment payment = new DriverPayment();

            payment.setDate(salaryDate);
            payment.setAmount(netSalary.doubleValue()+"");
            payment.setDriverName(driver.getDriverName());

            payment.setComment(String.format(
                    "Salary for %s | Monthly Salary: %s | "
                    + "Approved Leave Days: %d | "
                    + "Leave Deduction: %s | Net Salary: %s",
                    monthLabel,
                    monthlySalary.setScale(2, RoundingMode.HALF_UP),
                    leaveDays.size(),
                    deduction,
                    netSalary));

            payment.setTransaction("Deposite");
            payment.setOnwerMobile(ownerMobile);

            paymentRepository.save(payment);
            count++;
        }

        System.out.println(
                "Net salary credited for " + count
                        + " drivers for " + monthLabel);
    }
}
