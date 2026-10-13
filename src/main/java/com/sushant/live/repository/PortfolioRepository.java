
package com.sushant.live.repository;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Optional;

@Repository
public class PortfolioRepository {

	@Autowired
    private  NamedParameterJdbcTemplate jdbcTemplate;
	
	@Autowired
    private  ObjectMapper objectMapper;

    private static final String PORTFOLIO_SQL = """
        WITH customer_base AS (
            SELECT DISTINCT TRIM(customer_name) AS customer_name
            FROM coustomer_order
            WHERE customer_name IS NOT NULL
              AND TRIM(customer_name) <> ''
              AND LOWER(TRIM(customer_name)) =
                  LOWER(TRIM(:customerName))
        ),

        customer_machines AS (
            SELECT
                cb.customer_name,
                ARRAY_AGG(DISTINCT TRIM(x.machine_number))
                    FILTER (
                        WHERE x.machine_number IS NOT NULL
                          AND TRIM(x.machine_number) <> ''
                    ) AS machine_numbers
            FROM customer_base cb
            JOIN coustomer_order co
              ON TRIM(co.customer_name) = cb.customer_name
            CROSS JOIN LATERAL
                UNNEST(
                    STRING_TO_ARRAY(COALESCE(co.machins, ''), ',')
                ) AS x(machine_number)
            GROUP BY cb.customer_name
        )

        SELECT
            cb.customer_name,

            TO_JSONB(
				    COALESCE(cm.machine_numbers, ARRAY[]::TEXT[])
				) AS machine_numbers,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(o)), '[]'::JSONB)
                FROM (
                    SELECT id, address, advance, customer_name,
                           delivery_date, machins, onwer_mobile,
                           order_date, status
                    FROM coustomer_order
                    WHERE TRIM(customer_name) = cb.customer_name
                    ORDER BY id DESC
                ) o
            ) AS orders,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(i)), '[]'::JSONB)
                FROM (
                    SELECT id, billed_date, invoice, omobile, customer_name
                    FROM invoice
                    WHERE TRIM(customer_name) = cb.customer_name
                    ORDER BY id DESC
                ) i
            ) AS invoices,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(p)), '[]'::JSONB)
                FROM (
                    SELECT id, customer_name, owner_mobile,
                           payment, payment_date
                    FROM payment
                    WHERE TRIM(customer_name) = cb.customer_name
                    ORDER BY id DESC
                ) p
            ) AS payments,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(v)), '[]'::JSONB)
                FROM (
                    SELECT id, company, machine_number,
                           onwer_mobile, v_type
                    FROM vehicale
                    WHERE machine_number = ANY(
                        COALESCE(cm.machine_numbers, ARRAY[]::TEXT[])
                    )
                    ORDER BY machine_number
                ) v
            ) AS vehicles,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(d)), '[]'::JSONB)
                FROM (
                    SELECT id, driver_aadhar, driver_address,
                           driver_liencense, driver_mobile, driver_name,
                           machine_number, onwer_mobile, create_date,
                           driver_salary
                    FROM vehicale_driver
                    WHERE machine_number = ANY(
                        COALESCE(cm.machine_numbers, ARRAY[]::TEXT[])
                    )
                    ORDER BY driver_name
                ) d
            ) AS drivers,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(dp)), '[]'::JSONB)
                FROM (
                    SELECT DISTINCT
                           p.id, p.amount, p.driver_name,
                           p.onwer_mobile, p.payment_date,
                           p.comment, p.transaction
                    FROM driver_payment p
                    WHERE p.driver_name IN (
                        SELECT DISTINCT vd.driver_name
                        FROM vehicale_driver vd
                        WHERE vd.machine_number = ANY(
                            COALESCE(
                                cm.machine_numbers, ARRAY[]::TEXT[]
                            )
                        )
                    )
                    ORDER BY p.id DESC
                ) dp
            ) AS driver_payments,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(vch)), '[]'::JSONB)
                FROM (
                    SELECT id, user_comment, driver_name,
                           machine_number, amount, create_date, o_number
                    FROM vouchers
                    WHERE machine_number = ANY(
                        COALESCE(cm.machine_numbers, ARRAY[]::TEXT[])
                    )
                    ORDER BY id DESC
                ) vch
            ) AS vouchers,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(dt)), '[]'::JSONB)
                FROM (
                    SELECT id, advance, create_date, customer_name,
                           diesel, is_billed, item, omobile,
                           soil_brass, soil_rate, total_payment,
                           submitted_by, selected_vehicle
                    FROM dumper_treep
                    WHERE TRIM(customer_name) = cb.customer_name
                    ORDER BY id DESC
                ) dt
            ) AS dumper_trips,

            (
                SELECT COALESCE(JSONB_AGG(TO_JSONB(mr)), '[]'::JSONB)
                FROM (
                    SELECT maintenance, order_name, billed, diesel,
                           diesel_img, driver_name, end_reading,
                           end_reading_img, fuel_rate, machine_number,
                           onwer_mobile, petrol_pump, reading_date,
                           start_reading, start_reading_img
                    FROM machinereading
                    WHERE TRIM(order_name) = cb.customer_name
                    ORDER BY reading_date DESC NULLS LAST
                ) mr
            ) AS machine_readings

        FROM customer_base cb
        LEFT JOIN customer_machines cm
          ON cm.customer_name = cb.customer_name
        ORDER BY cb.customer_name
        """;

    public Optional<ObjectNode> findPortfolio(String customerName) {

        MapSqlParameterSource parameters =
            new MapSqlParameterSource()
                .addValue("customerName", customerName.trim());

        return jdbcTemplate.query(PORTFOLIO_SQL, parameters, rs -> {
            if (!rs.next()) {
                return Optional.empty();
            }

            ObjectNode portfolio = objectMapper.createObjectNode();

            portfolio.put("customer_name",
                rs.getString("customer_name"));

            addJsonField(portfolio, rs, "machine_numbers");
            addJsonField(portfolio, rs, "orders");
            addJsonField(portfolio, rs, "invoices");
            addJsonField(portfolio, rs, "payments");
            addJsonField(portfolio, rs, "vehicles");
            addJsonField(portfolio, rs, "drivers");
            addJsonField(portfolio, rs, "driver_payments");
            addJsonField(portfolio, rs, "vouchers");
            addJsonField(portfolio, rs, "dumper_trips");
            addJsonField(portfolio, rs, "machine_readings");

            return Optional.of(portfolio);
        });
    }

    private void addJsonField(
            ObjectNode result,
            ResultSet rs,
            String column
    ) throws SQLException {

        Object value = rs.getObject(column);

        if (value == null) {
            result.set(column, objectMapper.createArrayNode());
            return;
        }

        try {
            JsonNode json = objectMapper.readTree(value.toString());
            result.set(column, json);
        } catch (Exception ex) {
            throw new IllegalStateException(
                "Failed to parse portfolio field: " + column, ex
            );
        }
    }
}
