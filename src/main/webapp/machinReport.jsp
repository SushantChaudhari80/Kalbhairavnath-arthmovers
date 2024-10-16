<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine and Driver Details</title>
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

        h2 {
            text-align: center;
            color: #4a76a8;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .info-box {
            flex: 1;
            padding: 10px;
            background-color: #eef2f7;
            border: 1px solid #dce1e8;
            border-radius: 5px;
            margin-right: 10px;
        }

        .info-box:last-child {
            margin-right: 0;
        }

        .info-box h3 {
            font-size: 16px;
            margin-bottom: 8px;
            color: #3d5a80;
        }

        .table-container {
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
    </style>
	<!-- Include jQuery -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

		<!-- Include DataTables CSS -->
		<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

		<!-- Include DataTables JavaScript -->
		<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script>
	 // Function to retrieve query parameters from URL
	    function getQueryParameter(param) {
	        const urlParams = new URLSearchParams(window.location.search);
	        return urlParams.get(param);
	    }

	    // Retrieve the driverId from the URL
	    const driverId = getQueryParameter('driverId');
	    const driverName = getQueryParameter('driverName');
	    console.log(driverId , driverName);
		$('#machin-number').text(driverName || 'No Name Provided'); 
		
		$(document).ready(function() { 
			$('#machin-number').text(driverName || 'No Name Provided');
			
			
		});
	    
	   </script>
</head>
<body>

<div class="container">
    <h2>Machine and Driver Details</h2>

    <div class="info-section">
        <div class="info-box">
            <h3>Machine Number</h3>
            <span id="machin-number">Loading....</span> <!-- Replace with dynamic data as needed -->
        </div>
        <div class="info-box">
            <h3>Related Drivers</h3>
            <p>Driver 1: </p> <!-- Replace with dynamic data as needed -->
            <p>Driver 2: </p> <!-- Replace with dynamic data as needed -->
        </div>
    </div>

    <div class="table-container">
        <h3>Machine Reading Table</h3>
        <table>
            <thead>
                <tr>
                    <th>Date</th>
                    <th>Start Reading</th>
                    <th>End Reading</th>
                    <th>Total Hours</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>2024-09-26</td> <!-- Replace with dynamic data as needed -->
                    <td>100</td> <!-- Replace with dynamic data as needed -->
                    <td>150</td> <!-- Replace with dynamic data as needed -->
                    <td>5</td> <!-- Replace with dynamic data as needed -->
                </tr>
                <!-- Additional rows as needed -->
            </tbody>
        </table>
    </div>
</div>

</body>
</html>
