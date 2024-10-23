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

    <!-- Diesel Data Table -->
    <table id="dieselReport">
        <thead>
        <tr>
            <th>ID</th>
            <th>Date</th>
            <th>Vehicle Number</th>
            <th>Fuel Used (L)</th>
            <th>Amount</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>

<script>
    $(document).ready(function () {
        const table = $('#dieselReport').DataTable({
            columns: [
                { title: "ID" },
                { title: "Date" },
                { title: "Vehicle Number" },
                { title: "Fuel Used (L)" },
                { title: "Amount" }
            ]
        });

        // Fetch data and populate the table
        $.ajax({
            url: '/vehicle/getAll', // Adjust the endpoint URL if needed
            type: 'GET',
            dataType: 'json',
            success: function (data) {
                let totalFuel = 0;
                let totalVehicles = new Set();

                table.clear();

                data.forEach(function (record) {
                    let fuelUsed = Number(record.disel) || 0;
                    let amount = fuelUsed * 92; // Assume 92 is the fuel price per liter
                    totalFuel += fuelUsed;

                    // Track unique vehicles
                    totalVehicles.add(record.machineNumber);

                    table.row.add([
                        record.id,
                        record.date || '',
                        record.machineNumber || '',
                        fuelUsed,
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
    });
</script>

</body>
</html>
