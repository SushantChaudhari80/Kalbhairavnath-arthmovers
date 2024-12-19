
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dumper Quotation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
		<style>
		    /* General Reset */
		    * {
		        margin: 0;
		        padding: 0;
		        box-sizing: border-box;
		    }

		    body {
		        font-family: 'Poppins', sans-serif;
		        background-color: #f4f4f4;
		        color: #2c3e50;
		        display: flex;
		        justify-content: center;
		        align-items: center;
		        min-height: 100vh;
		        padding: 20px;
		    }

		    /* Container Styles */
		    .quotation-container {
		        width: 100%;
		        max-width: 800px;
		        background: #fff;
		        padding: 20px;
		        border-radius: 10px;
		        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
		    }

		    .quotation-header {
		        text-align: center;
		        border-bottom: 2px solid #3498db;
		        padding-bottom: 10px;
		        margin-bottom: 20px;
		    }

		    .quotation-header h1 {
		        font-size: 24px;
		        font-weight: 600;
		        color: #3498db;
		    }

		    /* Form Styles */
		    .quotation-form {
		        margin-bottom: 20px;
		    }

		    .quotation-form label {
		        font-size: 16px;
		        margin-bottom: 5px;
		        display: block;
		        font-weight: 500;
		    }

		    .quotation-form input,
		    .quotation-form select {
		        width: 100%;
		        padding: 10px;
		        margin-bottom: 15px;
		        border: 1px solid #ddd;
		        border-radius: 5px;
		        font-size: 14px;
		        color: #2c3e50;
		    }

		    /* Invoice Styles */
		    .invoice-container {
		        margin-top: 20px;
		        border: 1px solid #000;
		        padding: 20px;
		        background-color: #fdfdfd;
		    }

		    .invoice-container .header {
		        text-align: center;
		        font-weight: bold;
		        font-size: 18px;
		        border-bottom: 2px solid #000;
		        margin-bottom: 15px;
		        padding-bottom: 10px;
		    }

		    .invoice-container .sub-header {
		        text-align: center;
		        font-size: 14px;
		        margin-bottom: 20px;
		    }

		    .invoice-container .details {
		        margin: 10px 0;
		        font-size: 14px;
		    }

		    .invoice-container .details span {
		        display: inline-block;
		        margin-right: 15px;
		    }

		    .invoice-container .details .field {
		        font-weight: bold;
		    }

		    .invoice-container table {
		        width: 100%;
		        border-collapse: collapse;
		        margin-top: 15px;
		    }

		    .invoice-container table,
		    .invoice-container th,
		    .invoice-container td {
		        border: 1px solid #000;
		    }

		    .invoice-container th,
		    .invoice-container td {
		        padding: 8px;
		        text-align: left;
		    }

		    .invoice-container .totals {
		        font-weight: bold;
		    }

		    .invoice-container .footer {
		        display: flex;
		        justify-content: space-between;
		        align-items: center;
		        margin-top: 20px;
		    }

		    .invoice-container .footer .signature {
		        border-top: 1px solid #000;
		        width: 200px;
		        text-align: center;
		        padding-top: 5px;
		    }

		    /* Button Styles */
		    .print-btn {
		        display: inline-block;
		        margin-top: 20px;
		        padding: 12px 20px;
		        background-color: #3498db;
		        color: white;
		        font-size: 16px;
		        font-weight: 600;
		        border: none;
		        border-radius: 5px;
		        cursor: pointer;
		        transition: background-color 0.3s ease;
		    }

		    .print-btn:hover {
		        background-color: #2980b9;
		    }
			
			#customerName {
					       color: red;
					   }

		    /* Print-only Styles */
		    @media print {
		        body * {
		            visibility: hidden;
		        }

		        #quotation-summary,
		        #quotation-summary * {
		            visibility: visible;
		        }

		        #quotation-summary {
		            position: absolute;
		            top: 0;
		            left: 0;
		            width: 100%;
		        }
		    }
		</style>

    </style>
	
</head>
<body>
    <div class="quotation-container">
        <div class="quotation-header">
            <h1>Quotation</h1>
        </div>
        <form id="quotation-form" class="quotation-form">
            <label for="customer-name">Customer Name</label>
            <input type="text" id="customer-name" placeholder="Enter customer name">

			<div class="filter-item">
			       <label for="vehicaleList">Select Vehicale</label>
					<select id="vehicaleList">
										        <!-- Driver options will be dynamically appended -->
					</select>
			 </div>

            <label for="diesel">Diesel (Liters)</label>
            <input type="number" id="diesel" placeholder="Enter diesel in liters">

            <label for="advance">Advance Payment (₹)</label>
            <input type="number" id="advance" placeholder="Enter advance amount">

            <label for="soil-brass">Number of Brass Soil</label>
            <input type="number" id="soil-brass" placeholder="Enter number of brass">

            <label for="soil-rate">Soil Rate per Brass (₹)</label>
            <input type="number" id="soil-rate" placeholder="Enter rate per brass" value="1000">
        </form>

        <div class="quotation-summary" id="quotation-summary">
            <h2>Receipt</h2>
            
			<div class="invoice-container">
			        <div class="header"><span id="customerName">Loading....</span></div>
			        <div class="sub-header">
			            <p><span id="o-name">Loading....</span>| GST No:<span id="gst-number">Loading....</span></p>
			            <p><span id="address">Loading....</span> | Sand, Bricks, Cement, Steel, Crush Sand And all building Materials</p>
			        </div>
			        <div class="details">
			            <span class="field">Name:</span><span id="summary-customer-name"> </span>
			            <span class="field">Address:</span><span> Loading</span>
			            <span class="field">Date:</span><span id="summary-date">Loading</span>
			        </div>
			        <table>
			            <thead>
			                <tr>
			                    <th>No</th>
			                    <th>Details</th>
								<th>Vehicle Number</th>
								<th>Disel</th>
			                    <th>Pices/Brass</th>
			                    <th>Rate</th>
			                    <th>Amount</th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td>1</td>
			                    <td>Soil</td>
								<td id="summary-vehicle-number"></td>
								<td id="summary-diesel"></td>
			                    <td id="summary-soil-brass">N/A</td>
			                    <td id="summary-soil-rate">N/A</td>
			                    <td id="summary-total-payment">N/A/-</td>
			                </tr>
			            </tbody>
			        </table>
			        <div class="details">
			            <span class="field">Total:</span><span id="summary-total-payment1">N/A/-</span>
			            <span class="field">Paid:</span><span id="summary-advance"></span>
			            <span><span class="field">Due:</span></span>
			        </div>
			        <div class="footer">
			            <div>Customer Sign</div>
			            <div id="signatureId" class="signature">Loading</div>
			        </div>
			    </div>
			
        </div>

        <button class="print-btn" id="print-btn">Download as PDF</button>
    </div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	 <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script>
		
		$(document).ready(function () {
			function getFormattedDate() {
			    const today = new Date();
			    const dd = String(today.getDate()).padStart(2, '0'); // Get day and add leading zero if needed
			    const mm = String(today.getMonth() + 1).padStart(2, '0'); // Months are 0-based, add 1 and leading zero
			    const yyyy = today.getFullYear(); // Get full year

			    return dd+'/'+mm+'/'+yyyy;
			}
		    // Fetch and populate the vehicle dropdown
		    $.ajax({
		        url: '/api/vehicles/getAll/loading',
		        type: 'GET',
		        success: function (vehicles) {
		            const vehicleList = $('#vehicaleList');
		            vehicleList.empty();
		            vehicleList.append('<option value="">Select a Vehicle</option>');
		            vehicles.forEach(function (vehicle) {
		                const option = $('<option></option>').val(vehicle.id).text(vehicle.machine_number || vehicle.machineNumber);
		                vehicleList.append(option);
		            });
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching vehicle data:", error);
		        }
		    });
			$.ajax({
				                url: '/api/customers/get',  // URL for fetching the customer data
				                type: 'GET',
				                success: function(customer) {
				                    // Update the UI with the customer data
				                    $('#customerName').text(customer.bussinessName);
									$('#o-name').text(customer.name);
									$('#gst-number').text(customer.gstNo);//address
									$('#address').text(customer.address);//signatureId
									$('#signatureId').text('For '+customer.bussinessName);
									$('.spinner-container').hide();
									const formattedDate = getFormattedDate();
									console.log(formattedDate);
									document.getElementById('summary-date').innerText = formattedDate || '-';
				                },
				                error: function(xhr, status, error) {
				                    console.error("Error fetching customer data:", error);
				                }
				            });

		    // Update summary when dropdown changes
		    $('#vehicaleList').on('change', function () {
		        const selectedVehicle = $(this).find('option:selected').text();
		        document.getElementById('summary-vehicle-number').innerText = selectedVehicle || '-';
		    });

		    // Update summary dynamically
		    document.getElementById('quotation-form').addEventListener('input', function () {
		        const customerName = document.getElementById('customer-name').value;
		        const diesel = document.getElementById('diesel').value;
		        const advance = document.getElementById('advance').value;
		        const soilBrass = document.getElementById('soil-brass').value;
		        const soilRate = document.getElementById('soil-rate').value;

		        // Calculate total payment
		        const totalPayment = soilBrass * soilRate;

		        // Update summary
				//$('#customer-name').text(customer.name);
		        document.getElementById('summary-customer-name').innerText = customerName || '-';
		        document.getElementById('summary-diesel').innerText = diesel || '-';
		        document.getElementById('summary-advance').innerText = advance || '-';
		        document.getElementById('summary-soil-brass').innerText = soilBrass || '-';
		        document.getElementById('summary-soil-rate').innerText = soilRate || '-';
		        document.getElementById('summary-total-payment').innerText = totalPayment || '-';
				document.getElementById('summary-total-payment1').innerText = totalPayment || '-';
		    });

		    // Print functionality
		    document.getElementById('print-btn').addEventListener('click', function () {
			         	const customerName = document.getElementById('customer-name').value;
					        const diesel = document.getElementById('diesel').value;
					        const advance = document.getElementById('advance').value;
					        const soilBrass = document.getElementById('soil-brass').value;
					        const soilRate = document.getElementById('soil-rate').value;

					        // Calculate total payment
					        const totalPayment = soilBrass * soilRate;
							const selectedVehicleText = document.getElementById('vehicaleList').options[document.getElementById('vehicaleList').selectedIndex].text;


				               const formData = {
				                   selectedVehicle: selectedVehicleText,
				                   customerName:customerName,
				                   diesel: diesel,
				                   advance: advance,
				                   soilBrass: soilBrass,
				                   soilRate: soilRate,
				                   totalPayment:totalPayment
				               };
                              console.log(formData);
				               $.ajax({
				                   url: '/api/treep/add', // Endpoint URL
				                   type: 'POST',
				                   contentType: 'application/json',
				                   data: JSON.stringify(formData),
				                   success: function (response) {
				                       console.log(response);
				                   },
				                   error: function (xhr, status, error) {
				                       console.error('Error:', error);
				                   }
				               });
		        window.print();
		    });
		});


    </script>
</body>
</html>
