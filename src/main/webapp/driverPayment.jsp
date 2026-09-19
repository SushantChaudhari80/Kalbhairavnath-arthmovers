<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Payment Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 20px;
            color: #333;
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        h2, h1 {
            text-align: center;
            color: #4a76a8;
        }

        .btn {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
        }

        .btn:hover {
            background-color: #3498db;
        }

        .btn-primary {
            background-color: #2980b9;
            color: white;
        }

        .page-header {
            align-items: center;
            margin-bottom: 20px;
        }
        .driver-meta-data{
            display: flex;
            justify-content: space-between;
            flex: row;
        }
        

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 15px;
            background-color: #eef2f7;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .filters input[type="text"], .filters input[type="date"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters .btn-filter {
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters .btn-filter:hover {
            background-color: #2ecc71;
        }

        .payment-table {
            margin-top: 20px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #4a76a8;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .payment-summary {
            display:flex;
            flex-direction:row;
            justify-content:space-between;
            margin-top: 30px;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
        }

        .payment-summary h3 {
            font-size: 20px;
            margin-bottom: 15px;
        }

        .payment-summary p {
            font-size: 16px;
            margin-bottom: 10px;
        }
        .payment-summary div{
          	width: 100%; 
        }

        .payment-summary div p span {
            font-weight: bold;
            color: #27ae60;
        }
		body {
		            font-family: 'Roboto', sans-serif;
		            background-color: #f4f7fa;
		            margin: 0;
		            padding: 20px;
		            color: #333;
		        }

		        .container {
		            max-width: 900px;
		            margin: 0 auto;
		            background: #fff;
		            border-radius: 8px;
		            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
		            padding: 20px;
		        }

		        h1 {
		            text-align: center;
		            color: #4a76a8;
		        }

		        .btn {
		            padding: 10px 20px;
		            background-color: #2980b9;
		            color: white;
		            text-decoration: none;
		            border-radius: 5px;
		            display: inline-block;
		        }

		        .btn:hover {
		            background-color: #3498db;
		        }

		        /* Modal styles */
		        .modal {
		            display: none;
		            position: fixed;
		            z-index: 1;
		            left: 0;
		            top: 0;
		            width: 100%;
		            height: 100%;
		            overflow: auto;
		            background-color: rgba(0, 0, 0, 0.4);
		        }

		        .modal-content {
		            background-color: #fff;
		            margin: 15% auto;
		            padding: 20px;
		            border: 1px solid #888;
		            width: 400px;
		            border-radius: 8px;
		        }

		        .modal-header {
		            display: flex;
		            justify-content: space-between;
		            align-items: center;
		        }

		        .close {
		            color: #aaa;
		            font-size: 28px;
		            font-weight: bold;
		            cursor: pointer;
		        }

		        .close:hover {
		            color: #000;
		        }

		        .form-group {
		            margin-bottom: 15px;
		        }

		        .form-group label {
		            display: block;
		            margin-bottom: 5px;
		        }

		        .form-group input {
		            width: 100%;
		            padding: 10px;
		            border: 1px solid #ddd;
		            border-radius: 5px;
		        }

		        .modal-footer {
		            text-align: right;
		        }

		        .btn-submit {
		            background-color: #27ae60;
		            color: white;
		            border: none;
		            padding: 10px 20px;
		            border-radius: 5px;
		        }

		        .btn-submit:hover {
		            background-color: #2ecc71;
		        }
    </style>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Include DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

    <!-- Include DataTables JavaScript -->
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<jsp:include page="url.jsp" />
    <script>
        // Function to retrieve query parameters from URL
        function getQueryParameter(param) {
            const urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }
		

		$(document).ready(function() {
		    // Retrieve the driverId and driverName from the URL
		    const driverId = getQueryParameter('driverId');
		    const driverName = getQueryParameter('driverName');
		    console.log(driverId, driverName);
		    let DOJ = null;
		    //Load Driver Metadata
             $.ajax({
					url: prod_url+'/api/driver/getById?drId=' + driverId,
					type: 'GET',
					success: function (driver) {
						DOJ = driver.createDate;
						console.log(driver);
						$('#driverDOJ').html('<b>' + driver.createDate + '</b>');
						$('#driverMobile').html('<b>' + driver.driverMobile + '</b>');
						$('#driverAv').html('<b>' + driver.machineNumber + '</b>');
						$('#driverSalary').html('<b>' + driver.driverSalary + '</b>');
					},
					error: function (xhr, status, error) {
					    console.error("Error fetching driver data:", error);
					 }
			});		    
		        
		    
		    //---------------------------------
			
			const table = $('#paymenTable').DataTable({
				        columns: [
				            { title: "Payment ID" },
				            { title: "Driver Name" },
				            { title: "Date" },
				            { title: "Amount" },
				            { title: "Comment" },
				            { title: "Transaction" }
				        ]
				    });
					
					$.ajax({
					            url: prod_url+'/api/driver/payment/getAll?driverName='+driverName, // Replace with your API endpoint for removal
						        type: 'GET',
						        success: function(records) {
									console.log(records);
									table.clear();
										            records.forEach(function (record) {
										                table.row.add([
										                    record.id,
										                    record.driverName || '',
										                    record.date || '',
										                    record.amount || '',
										                    record.comment || '',
										                    record.transaction || ''
										                ]);
										            });

										            // Draw the table after all rows are added
										            table.draw();	
										            $('#totalPayments').text(records.length);
										            const totalPaidAmount = records.reduce((sum, record) => {
										                if (record.transaction &&
										                    record.transaction.toLowerCase() === 'withdrow' ) {
										                    return sum + (parseFloat(record.amount) || 0);
										                }
										                return sum;
										            }, 0);
													$('#totalAmount').text(totalPaidAmount);
													
													const totalPayableAmount = records.reduce((sum, record) => {
										                if (record.transaction &&
										                    record.transaction.toLowerCase() === 'deposite') {
										                    return sum + (parseFloat(record.amount) || 0);
										                }
										                return sum;
										            }, 0);
													$('#totalPayableAmount').text(totalPayableAmount);
													const totalDue = totalPayableAmount - totalPaidAmount;
													if(totalDue < 0){
														$('#totalDue').text(totalDue).css('color', 'red');
													}else{
														$('#totalDue').text(totalDue);
													}
													
						          },
							      error: function(xhr, status, error) {
								      console.error("Error removing driver:", error);
							      }
					 });		

		    // Update the driverInfo span with the driverName
		    $('#driverInfo').html('<b>' + driverName.toUpperCase() + '</b>');
		    
		    // Event listener for opening the modal
		    $('#addPaymentBtn').on('click', function () {
		        $('#addPaymentModal').fadeIn();  // Show the modal
		    });

		    // Close modal when 'x' or anywhere outside the modal content is clicked
		    $('.close').on('click', function () {
		        $('#addPaymentModal').fadeOut();  // Hide the modal
		    });

		    $(window).on('click', function (e) {
		        if ($(e.target).is('#addPaymentModal')) {
		            $('#addPaymentModal').fadeOut();  // Hide the modal if clicked outside
		        }
		    });

		    // Handle form submission
		    $('#paymentForm').on('submit', function (e) {
		        e.preventDefault();
		        const amount = $('#paymentAmount').val();
		        const paymentCmt = $('#paymentCmt').val();
		        // Log the data or perform AJAX request to save payment details
		        console.log('Payment Submitted:', { driverName, amount });
				$.ajax({
					        url: prod_url+'/api/driver/payment/save?driverName='+driverName+'&amount='+amount+'&comment='+paymentCmt, // Replace with your API endpoint for removal
					        type: 'GET',
					        success: function(response) {
								alert(response);
								$(this).trigger('reset');
								$('#addPaymentModal').fadeOut();
					        },
					        error: function(xhr, status, error) {
					            console.error("Error removing driver:", error);
					        }
					    });
		    });
		});


    </script>
</head>
<body>
    <div class="container">
        <h1>Driver Payment Management</h1>

        <div class="page-header">
            <div class="driver-meta-data">
				<div>
				    <label for="driverInfo">Driver Name :</label>
				    <span id="driverInfo"></span>
				</div>
				<button id="addPaymentBtn" class="btn btn-primary">Add Payment</button>
			</div>
			<div class="driver-meta-data">
			    <div>
				    <label for="driverSalary">Salary :</label>
				    <span id="driverSalary"></span>
				</div>
			    <div>
				    <label for="driverDOJ">Joining Date :</label>
				    <span id="driverDOJ"></span>
				</div>
				<div>
				    <label for="driverMobile">Driver Mobile :</label>
				    <span id="driverMobile"></span>
				</div>
				<div>
				    <label for="driverAv">Assigned Vehicle :</label>
				    <span id="driverAv"></span>
				</div>
			</div>

            
        </div>

        <!-- <div class="filters">
            <input type="text" id="driverName" placeholder="Search by Driver Name">
            <input type="date" id="startDate" placeholder="Start Date">
            <input type="date" id="endDate" placeholder="End Date">
            <button class="btn-filter">Apply Filters</button>
        </div> -->
        
        <div class="payment-summary">
            <div>
	            <h3>Payment Summary</h3>
	            <p>Total Payments: <span id="totalPayments">0</span></p>
	            <p>Total Paid Amount: <span id="totalAmount">$0.00</span></p>
            </div>
             <div>
	            <h3> : </h3>
	            <p>Total Payable Amount: <span id="totalPayableAmount">0</span></p>
	            <p>Total Due: <span id="totalDue">$0.00</span></p>
            </div>
            
        </div>

        <div class="payment-table">
            <table id="paymenTable">
                <thead>
                    <tr>
                        <th>Payment ID</th>
                        <th>Driver Name</th>
                        <th>Date</th>
                        <th>Amount</th>
                        <th>Comment</th>
                        <th>Transaction</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Payment records will be inserted here -->
                </tbody>
            </table>
        </div>

        
    </div>
	<div id="addPaymentModal" class="modal">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h3>Add Payment</h3>
	                <span class="close">&times;</span>
	            </div>

	            <form id="paymentForm">
	                <div class="form-group">
	                    <label for="paymentAmount">Amount</label>
	                    <input type="number" id="paymentAmount" name="paymentAmount" required>
	                </div>
	                
	                <div class="form-group">
	                    <label for="paymentCmt">Comment</label>
	                    <input type="text" id="paymentCmt" name="paymentCmt">
	                </div>

	                <div class="modal-footer">
	                    <button type="submit" class="btn-submit">Submit Payment</button>
	                </div>
	            </form>
	        </div>
	    </div>
</body>
</html>
