<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Vehicles Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
		#duePayment {
		       color: red;
		   }
		
        /* Orders Table */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        table thead {
            background-color: #2980b9;
            color: white;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        table tbody tr:hover {
            background-color: #f4f4f4;
            cursor: pointer;
        }

        table .status {
            padding: 5px 10px;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
            color: #2C3E50;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        /* Page Header */
        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 28px;
            font-weight: 500;
        }

        .btn {
            padding: 10px 20px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        /* Filters Section */
        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
            padding: 10px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .filters select, .filters input {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters button {
            padding: 10px 15px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters button:hover {
            background-color: #2ecc71;
        }

        /* Vehicles Section */
        .vehicles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .vehicle-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
        }

        .vehicle-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .vehicle-card p {
            color: black;
            margin-bottom: 15px;
        }
        .vehicle-card {
		    border: 1px solid red;  /* Temporary border to see the vehicle cards */
		    background-color: white;
		}
        

        .vehicle-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .status-active {
            background-color: #2ecc71;
            color: white;
        }

        .status-maintenance {
            background-color: #e67e22;
            color: white;
        }

        .status-unavailable {
            background-color: #e74c3c;
            color: white;
        }

        /* Modal for Detailed View */
        .modal {
            display: none;
            position: fixed;
            z-index: 10;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            width: 500px;
            position: relative;
        }

        .modal-header h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .modal-body p {
            margin-bottom: 10px;
            font-size: 18px;
            color: #34495e;
        }

        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .filters {
                flex-direction: column;
            }

            .filters select, .filters input {
                margin-bottom: 10px;
                width: 100%;
            }

            .modal-content {
                width: 90%;
            }
           .machineNumberStyle {
			    background-color: #f0ad4e;  /* Amber color for machine number */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
			}
		
			
			
			.companyStyle {
			    background-color: #5bc0de;  /* Light blue background for company name */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
			}
			.spinner-container {
											    display: none; /* Hidden by default; show it when needed */
											    position: fixed;
											    top: 0;
											    left: 0;
											    width: 100%;
											    height: 100%;
											    background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
											    backdrop-filter: blur(5px); /* Blur effect */
											    z-index: 999; /* Above other elements */
											    justify-content: center; /* Center spinner horizontally */
											    align-items: center; /* Center spinner vertically */
											}

											.spinner {
												position: fixed;
												z-index: 999;
												top: 50%;
												left: 50%;
												transform: translate(-50%, -50%);
												border: 5px solid #f3f3f3;
												border-top: 5px solid #3498db;
												border-radius: 50%;
												width: 30px;
												height: 30px;
												animation: spin 1s linear infinite;
											}

											@keyframes spin {
											    0% { transform: rotate(0deg); }
											    100% { transform: rotate(360deg); }
											}

        }
    </style>
	<!-- Include jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	<!-- Include DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	
	<script>
		$(document).ready(function () {
		    $('.spinner-container').show();

		    // Initialize DataTable when the document is ready
		    const table = $('#vehicleTable').DataTable({
		        columns: [
		            {
		                title: "<input type='checkbox' id='selectAll'>",
		                orderable: false,
		                className: 'select-checkbox',
		            },
		            { title: "Treep ID" },
		            { title: "Date" },
		            { title: "Details" },
		            { title: "Customer Name" },
		            { title: "Vehicle Number" },
		            { title: "Diesel(Liter)" },
		            { title: "Advance Payment" },
		            { title: "Total Soil (Brass)" },
		            { title: "Soil Rate per Brass" },
		            { title: "Total Payment" }
		        ],
		        order: [[1, 'asc']], // Order by Treep ID by default
		    });

		    let selectedRows = [];

		    function calculateSums() {
		        let sumAdvance = 0;
		        let sumTotalPayment = 0;
		        let sumTotalDiesel = 0;

		        // Loop through only the visible rows (filtered rows)
		        table.rows({ filter: 'applied' }).every(function (rowIdx, tableLoop, rowLoop) {
		            const data = this.data();
		            const advance = parseFloat(data[7]) || 0; // Advance Payment is in the 7th column
		            const totalPayment = parseFloat(data[10]) || 0; // Total Payment is in the 10th column
		            const totalDiesel = parseFloat(data[6]) || 0; // Diesel is in the 6th column

		            sumAdvance += advance;
		            sumTotalPayment += totalPayment;
		            sumTotalDiesel += totalDiesel;
		        });

		        // Update the placeholders in the DOM
		        $('#sumAdvance').text(sumAdvance.toFixed(2));
		        $('#sumTotalPayment').text(sumTotalPayment.toFixed(2));
		        $('#sumTotalDiesel').text(sumTotalDiesel.toFixed(2));

		        // Calculate due payment
		        const due = sumTotalPayment - sumAdvance;
		        $('#duePayment').text(due.toFixed(2));
		    }

		    // Function to fetch vehicle data from the server using AJAX
		    function fetchVehiclesList() {
		        $.ajax({
		            url: '/api/treep/getAll', // URL for fetching vehicle data
		            type: 'GET',
		            success: function (vehicles) {
		                table.clear(); // Clear existing rows
		                console.log(vehicles);

		                // Loop through each vehicle and add it to the DataTable
		                vehicles.forEach(function (vehicle) {
		                    table.row.add([
		                        `<input type="checkbox" class="row-checkbox" data-id="${vehicle.id || ''}">`,
		                        vehicle.id || '',
		                        vehicle.createDate || '',
		                        vehicle.item || '',
		                        vehicle.customerName || '',
		                        vehicle.selectedVehicle || '',
		                        vehicle.diesel || '',
		                        vehicle.advance || '',
		                        vehicle.soilBrass || '',
		                        vehicle.soilRate || '',
		                        vehicle.totalPayment || ''
		                    ]);
		                });

		                table.draw(false); // Draw the table once all rows are added
		                $('.spinner-container').hide(); // Hide the spinner
		                calculateSums();
		            },
		            error: function (xhr, status, error) {
		                console.error("Error fetching vehicle data:", error);
		                $('.spinner-container').hide(); // Hide the spinner on error as well
		            }
		        });
		    }

		    // Update sums on filtering or searching
		    table.on('search.dt', function () {
		        calculateSums();
		    });

			$('#printbtn').on('click', function() {
				        calculateSums();
				        window.print();
				});
		    // Track checkbox selections
		    $('#vehicleTable tbody').on('change', '.row-checkbox', function () {
		        const id = $(this).data('id');
		        if (this.checked) {
		            selectedRows.push(id);
		        } else {
		            selectedRows = selectedRows.filter(rowId => rowId !== id);
		        }

		        // Enable/Disable the print button
		        if (selectedRows.length > 0) {
		            $('#printInvoiceBtn').prop('disabled', false);
		        } else {
		            $('#printInvoiceBtn').prop('disabled', true);
		        }
		    });

		    // Select/Deselect all rows
		    $('#selectAll').on('change', function () {
		        const isChecked = this.checked;
		        $('.row-checkbox').prop('checked', isChecked).trigger('change');
		    });

		    // Generate PDF for selected rows
			$('#printInvoiceBtn').on('click', function () {
			    // Gather selected rows by checking which checkboxes are checked
			    const selectedRows = [];
			    $('#vehicleTable tbody .row-checkbox:checked').each(function () {
			        const rowIndex = $(this).closest('tr').index();
			        const rowData = table.row(rowIndex).data(); // Fetch data for the row

			        if (rowData) {
			            selectedRows.push(rowData);
			        }
			    });

			    if (selectedRows.length === 0) {
			        alert('No rows selected for the invoice!');
			        return;
			    }

			    console.log("Selected Rows:", selectedRows); // Debugging: Log selected rows

			    // Generate the print content
			    let printContent = `
			        <html>
			        <head>
			            <title>Invoice</title>
			            <style>
			                body { font-family: Arial, sans-serif; margin: 20px; }
			                table { width: 100%; border-collapse: collapse; margin-top: 20px; }
			                table, th, td { border: 1px solid black; }
			                th, td { padding: 10px; text-align: left; }
			            </style>
			        </head>
			        <body>
			            <h2>Invoice</h2>
			            <table>
			                <thead>
			                    <tr>
			                        <th>Treep ID</th>
			                        <th>Date</th>
			                        <th>Details</th>
			                        <th>Customer Name</th>
			                        <th>Vehicle Number</th>
			                        <th>Diesel (Liter)</th>
			                        <th>Advance Payment</th>
			                        <th>Total Soil (Brass)</th>
			                        <th>Soil Rate per Brass</th>
			                        <th>Total Payment</th>
			                    </tr>
			                </thead>
			                <tbody>
			    `;

			  
				selectedRows.forEach(row => {
				    printContent += "<tr>";

				    if (Array.isArray(row)) {
				        // For array-based rows
				        row.forEach((value, index) => {
				            if (index === 0) return; // Skip checkbox column

				            let displayValue = value || "0"; // Default to "0" if value is empty
				            if (index === 5 && value === "Select a Vehicle") {
				                displayValue = "N/A"; // Handle special case for vehicle selection
				            }

				            printContent += "<td>" + displayValue + "</td>";
				        });
				    } else {
				        // For object-based rows
				        const keys = ["treepID", "date", "details", "customerName", "vehicleNumber", "diesel", "advancePayment", "totalSoil", "soilRate", "totalPayment"];
				        keys.forEach(key => {
				            let value = row[key] || "0"; // Default to "0" if value is empty
				            if (key === "vehicleNumber" && value === "Select a Vehicle") {
				                value = "N/A"; // Handle special case for vehicle selection
				            }

				            printContent += "<td>" + value + "</td>";
				        });
				    }

				    printContent += "</tr>";
				});


			    printContent += `
			                </tbody>
			            </table>
			        </body>
			        </html>
			    `;

			    // Open the content in a new window and print
			    const printWindow = window.open('', '_blank');
			    printWindow.document.write(printContent);
			    printWindow.document.close();
			    printWindow.print();
			});


		    // Call the function to load vehicle data when the page is ready
		    fetchVehiclesList();
		});

	</script>
</head>
<body>
	<div class="spinner-container">
					    <div class="spinner"></div>
					</div>
    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Treep Report</h1>
			<div>
	            <a id="printbtn" class="btn">Print</a>
				<a id="printInvoiceBtn" class="btn">Generate Invoice</a>
			</div>
        </div>
		  <div id="summary">
			   <p><strong>Sum of Total Payment: </strong><span id="sumTotalPayment">0</span></p>
		       <p><strong>Sum of Advance Payment: </strong><span id="sumAdvance">0</span></p>
			   <p><strong>Sum of Total Disel: </strong><span id="sumTotalDisel">0</span></p>
			   <p><strong>Due Payment: </strong><span id="duePayment">0</span></p>
		   </div>

		<table id="vehicleTable" class="display">
		    <thead>
		        <tr>
					<th></th>
					<th>Treep ID</th>
					<th>Date</th>
					<th>Details</th>
		            <th>Customer Name</th>
		            <th>Vehicle Number</th>
		            <th>Diesel (Liters)</th>
					<th>Advance Payment</th>
		            <th>Total Soil (Brass/qty)</th>
					<th>Soil Rate per Brass</th>
					<th>Total Payment</th>
		        </tr>
		    </thead>
		    <tbody>
		        <!-- Rows will be dynamically added here -->
		    </tbody>
		</table>
		
        <!-- Modal for Vehicle Details -->
        <div class="modal" id="vehicleModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Vehicle 01 Details</h2>
                </div>
                <div class="modal-body">
                    <p>Type: Truck</p>
                    <p>Status: Active</p>
                    <p>Last Serviced: 2024-08-01</p>
                    <p>License Plate: ABC-1234</p>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal() {
            document.getElementById('vehicleModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('vehicleModal').style.display = 'none';
        }
    </script>

</body>
</html>
