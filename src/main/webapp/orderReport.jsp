<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Report</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #34495e;
            margin-bottom: 30px;
        }

        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .filters .filter-item {
            display: flex;
            flex-direction: column;
            margin-right: 15px;
        }

        .filters label {
            margin-bottom: 5px;
            font-weight: 500;
            color: #2c3e50;
        }

        .filters input, .filters select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 200px;
        }

        .filters .btn-filter {
            align-self: flex-end;
            padding: 10px 20px;
            background-color: #27ae60;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .filters .btn-filter:hover {
            background-color: #2ecc71;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }

        th {
            background-color: #2980b9;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .summary {
            display: flex;
            justify-content: space-between;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
        }

        .summary-item {
            text-align: center;
            flex: 1;
            padding: 20px;
            border-right: 1px solid #ddd;
        }

        .summary-item:last-child {
            border-right: none;
        }

        .summary-item h3 {
            margin: 0;
            font-size: 24px;
            color: #34495e;
        }

        .summary-item p {
            margin: 5px 0 0;
            color: #7f8c8d;
        }

        .pagination {
            display: flex;
            justify-content: center;
            padding: 20px;
        }

        .pagination a {
            padding: 10px 20px;
            margin: 0 5px;
            background-color: #2980b9;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }

        .pagination a:hover {
            background-color: #3498db;
        }

        .pagination .active {
            background-color: #27ae60;
            color: white;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	   <!-- Include DataTables CSS -->
	   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	   <!-- Include DataTables JavaScript -->
	   <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
		    // Show spinner if needed (add your spinner logic)
		    $('.spinner-container').show();
		    
		    // Initialize DataTable when the document is ready
		    const table = $('#orderTable').DataTable({
		        columns: [
		            { title: "Order ID" },
		            { title: "Customer Name" },
		            { title: "Vehicale Number" },
		            { title: "Date" },
		            { title: "Total Hours" },
		            { title: "Diesel" }
		        ]
		    });

		    // Fetch and populate vehicle data into the table
		    $.ajax({
		        url: '/vehicle/getAll', // Adjust the endpoint URL if needed
		        type: 'GET',
		        dataType: 'json',
		        success: function (data) {
		            console.log(data);
		            // Clear the table before adding new rows
		            table.clear();

		            // Loop through each record and add it to the table
		            data.forEach(function (record) {
		                let totalHours = calculateTotalHours(record.startReading, record.endReading);

		                table.row.add([
		                    record.id,
		                    record.orderName || '',
		                    record.machineNumber || '', // Ensure 'machineNumber' exists in your data
		                    record.date || '',
		                    totalHours,
		                    record.disel || '' // Fixed typo 'disel' to 'diesel'
		                ]);
		            });

		            // Draw the table after all rows are added
		            table.draw();
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching records:", error);
		        }
		    });

		    // Function to calculate total hours
		    function calculateTotalHours(start, end) {
		        if (start && end) {
		            return end - start; // Simple difference, adjust if necessary
		        }
		        return 'N/A';
		    }

		    // Fetch vehicle list for the dropdown
		    $.ajax({
		        url: '/api/vehicles/getAll',
		        type: 'GET',
		        success: function (vehicles) {
		            const vehicleList = $('#vehicaleList'); // Target the select element
		            vehicleList.empty(); // Clear any previous options
		            vehicleList.append('<option value="">Select a Vehicale</option>'); // Placeholder option

		            vehicles.forEach(function (vehicle) {
		                const option = $('<option></option>').val(vehicle.id).text(vehicle.machine_number || vehicle.machineNumber);
		                vehicleList.append(option); // Append the option to the select element
		            });
		        },
		        error: function (xhr, status, error) {
		            console.error("Error fetching vehicle data:", error);
		        }
		    });

		    // Filter button event (optional logic for filtering)
		    $('#fltButton').on('click', function (e) {
		        e.preventDefault(); // Prevent form submission if it's within a form
		        // Add filter logic here if necessary
		    });
		});

	</script>
</head>
<body>

    <div class="container">
        <h1>Order Report</h1>

        <!-- Filters Section -->
        <div class="filters">
            <div class="filter-item">
                <label for="orderNumber">Order Number</label>
                <input type="text" id="orderNumber" placeholder="Enter order number">
            </div>
            <div class="filter-item">
                <label for="vehicaleList">Select Vehicale</label>
				<select id="vehicaleList">
							        <!-- Driver options will be dynamically appended -->
				</select>
            </div>
            <div class="filter-item">
                <label for="status">Status</label>
                <select id="status">
                    <option value="all">All</option>
                    <option value="completed">Completed</option>
                    <option value="pending">Pending</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
            <button id="fltButton" class="btn-filter">Filter</button>
        </div>

        <!-- Summary Section -->
        <div class="summary">
            <div class="summary-item">
                <h3 id="totalOrders">0</h3>
                <p>Total Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalCompleted">0</h3>
                <p>Completed Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalPending">0</h3>
                <p>Pending Orders</p>
            </div>
            <div class="summary-item">
                <h3 id="totalCancelled">0</h3>
                <p>Cancelled Orders</p>
            </div>
        </div>

        <!-- Orders Table Section -->
        <table id="orderTable">
            <thead>
                <tr >
                    <th>Order ID</th>
                    <th>Customer Name</th>
					<th>Vehicale Number</th>
                    <th>Date</th>
                    <th>Total hours</th>
                    <th>Diesel</th>
                </tr>
            </thead>
            <tbody>
               
            </tbody>
        </table>
    </div>

</body>
</html>
