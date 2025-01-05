<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diesel Report</title>
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

        .summary {
            display: flex;
            justify-content: space-between;
            background-color: #eef2f7;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 20px;
            flex-wrap: wrap;
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
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
    <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
</head>
<body>

<div class="container">
    <h1>Diesel Consumption Report</h1>

    <!-- Summary Section -->
    <div class="summary">
        <div class="summary-item">
            <h3 id="totalVehicles">0</h3>
            <p>Total Vehicles</p>
        </div>
        <div class="summary-item">
            <h3 id="totalFuelUsed">0 L</h3>
            <p>Total Fuel Used</p>
        </div>
        <div class="summary-item">
            <h3 id="totalDistance">0 km</h3>
            <p>Total Distance Covered</p>
        </div>
        <div class="summary-item">
            <h3 id="averageConsumption">0 L/km</h3>
            <p>Average Fuel Consumption</p>
        </div>
    </div>
	<div style="text-align: right; margin-bottom: 20px;">
	    <button id="addDieselBtn" style="padding: 10px 20px; background-color: #2980b9; color: white; border: none; border-radius: 5px; cursor: pointer;">
	        Add Diesel
	    </button>
	</div>

    <!-- Diesel Data Table -->
    <table id="dieselReport">
        <thead>
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Vehicle Number</th>
			<th>Fuel Pump</th>
			<th>Rate(L)</th>
            <th>Fuel Used (L)</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
	
	<div id="addDieselModal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5); justify-content: center; align-items: center;">
	    <div style="background: white; padding: 20px; width: 400px; border-radius: 8px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2); position: relative;">
	        <h2 style="margin-top: 0; text-align: center;">Add Diesel</h2>
	        <form id="addDieselForm">
				<div class="filter-item">
				   <label for="vehicaleList">Select Vehicale</label>
					<select id="vehicaleList" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;"></select>
				 </div>
	            <div style="margin-bottom: 15px;">
	                <label for="fuelInLtr" style="display: block; margin-bottom: 5px;">Fuel in Ltr</label>
	                <input type="number" id="fuelInLtr" name="fuelInLtr" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
	            </div>
	            <div style="margin-bottom: 15px;">
	                <label for="petrolPump" style="display: block; margin-bottom: 5px;">Select Petrol Pump</label>
	                <select id="petrolPump" name="petrolPump" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
	                    <option value="">-- Select Petrol Pump --</option>
	                    <option value="Indian Oil Corporation (IOCL)">Indian Oil Corporation (IOCL)</option>
	                    <option value="Bharat Petroleum Corporation Limited (BPCL)">Bharat Petroleum Corporation Limited (BPCL)</option>
	                    <option value="Hindustan Petroleum Corporation Limited (HPCL)">Hindustan Petroleum Corporation Limited (HPCL)</option>
						<option value="Reliance Petroleum">Reliance Petroleum</option>
						<option value="Shell India">Shell India</option>
						<option value="Essar Oil (Now Nayara Energy)">Essar Oil (Now Nayara Energy)</option>
						<option value="ONGC (Oil and Natural Gas Corporation)">ONGC (Oil and Natural Gas Corporation)</option>
	                </select>
	            </div>
	            <div style="margin-bottom: 15px;">
	                <label for="rate" style="display: block; margin-bottom: 5px;">Rate</label>
	                <input type="number" id="rate" name="rate" required step="0.01" style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;">
	            </div>
	            <div style="text-align: right;">
	                <button type="button" id="cancelBtn" style="margin-right: 10px; padding: 10px 20px; border: none; background-color: #ccc; border-radius: 5px; cursor: pointer;">
	                    Cancel
	                </button>
	                <button type="submit" style="padding: 10px 20px; background-color: #27ae60; color: white; border: none; border-radius: 5px; cursor: pointer;">
	                    Add
	                </button>
	            </div>
	        </form>
	    </div>
	</div>
</div>

<script>
    $(document).ready(function () {
        const table = $('#dieselReport').DataTable({
            columns: [
                { title: "ID" },
                { title: "Date" },
                { title: "Vehicle Number" },
				{ title: "Fuel Pump" },
				{ title: "Rate(L)" },
                { title: "Fuel Used (L)" },
                { title: "Amount" }
            ]
        });
		
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

        // Fetch data and populate the table
        $.ajax({
            url: '/vehicle/getDisel', // Adjust the endpoint URL if needed
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                let totalFuel = 0;
                let totalVehicles = new Set();

                table.clear();

                data.forEach(function (record) {
					console.log(record);
                    let fuelUsed = Number(record.diesel) || 0;
					let rate = Number(record.fuelRate) || 0;
                    let amount = fuelUsed * rate; // Assume 92 is the fuel price per liter
                    totalFuel += fuelUsed;

                    // Track unique vehicles
                    totalVehicles.add(record.machineNumber);

                    table.row.add([
                        record.id,
                        record.date || '',
                        record.machineNumber || '',
						record.petrolPump || '',
						record.fuelRate || '',
                        record.diesel || '',
                        amount.toFixed(2) // Round the amount to 2 decimal places
                    ]);
                });

                table.draw();

                // Update summary section
                $('#totalVehicles').text(totalVehicles.size);
                $('#totalFuelUsed').text(totalFuel + ' L');
            },
            error: function (xhr, status, error) {
                console.error("Error fetching records:", error);
            }
        });
		
		$('#addDieselBtn').on('click', function () {
		            $('#addDieselModal').fadeIn();
		        });

		        // Hide the modal
		        $('#cancelBtn').on('click', function () {
		            $('#addDieselModal').fadeOut();
		        });

		        // Handle form submission
		        $('#addDieselForm').on('submit', function (e) {
		            e.preventDefault();

		            const dieselData = {
			
		                vehicleNumber:  $('#vehicaleList option:selected').text(),
		                fuelInLtr: $('#fuelInLtr').val(),
		                petrolPump: $('#petrolPump').val(),
		                rate: $('#rate').val()
		            };

		            $.ajax({
		                url: '/api/diesel/addDiesel', // Adjust the endpoint URL if needed
		                type: 'POST',
		                contentType: 'application/json',
		                data: JSON.stringify(dieselData),
		                success: function (response) {
							console.log(response);
		                    alert(response);
		                    $('#addDieselModal').fadeOut();
		                    $('#addDieselForm')[0].reset();

		                    // Optionally, refresh the table
		                    $('#dieselReport').DataTable().ajax.reload();
		                },
		                error: function (xhr, status, error) {
		                    alert('Failed to add diesel record: ' + error);
		                }
		            });
		        });
		
    });
</script>

</body>
</html>