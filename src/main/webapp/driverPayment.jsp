<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Payment Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
	}
	
	body, html {
	    font-family: 'Poppins', sans-serif;
	    background-color: #f4f6f9;
	    color: #2C3E50;
	}
	
	.container {
	    max-width: 1200px;
	    margin: 20px auto;
	    padding: 20px;
	    background-color: #fff;
	    border-radius: 8px;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	}
	
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
	    transition: background-color 0.3s;
	}
	
	.btn:hover {
	    background-color: #3498db;
	}
	
	.filters {
	    display: flex;
	    justify-content: space-between;
	    margin-bottom: 20px;
	    padding: 15px;
	    background-color: #f7f7f7;
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
	    transition: background-color 0.3s;
	}
	
	.filters .btn-filter:hover {
	    background-color: #2ecc71;
	}
	
	.payment-table {
	    margin-top: 20px;
	    overflow-x: auto;
	}
	
	.payment-table table {
	    width: 100%;
	    border-collapse: collapse;
	}
	
	.payment-table th, .payment-table td {
	    padding: 12px 15px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	}
	
	.payment-table th {
	    background-color: #f2f2f2;
	    font-weight: 600;
	}
	
	.payment-table tbody tr:hover {
	    background-color: #f9f9f9;
	}
	
	.payment-summary {
	    margin-top: 30px;
	    background-color: #f7f7f7;
	    padding: 20px;
	    border-radius: 5px;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
	}
	
	.payment-summary h3 {
	    font-size: 24px;
	    margin-bottom: 15px;
	}
	
	.payment-summary p {
	    font-size: 18px;
	    margin-bottom: 10px;
	}
	
	#totalPayments, #totalAmount {
	    font-weight: bold;
	    color: #27ae60;
	}
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
	    $('#driverInfo').append(driverId);
	    
    </script>
</head>
<body>
    <div class="container">
        <div class="page-header">
            <h1>Driver Payment Management</h1>
            <span id="driverInfo">Driver ID : </span>
            <a href="#" class="btn btn-primary">Add Payment</a>
        </div>

        <div class="filters">
            <input type="text" id="driverName" placeholder="Search by Driver Name">
            <input type="date" id="startDate" placeholder="Start Date">
            <input type="date" id="endDate" placeholder="End Date">
            <button class="btn btn-filter">Apply Filters</button>
        </div>

        <div class="payment-table">
            <table>
                <thead>
                    <tr>
                        <th>Payment ID</th>
                        <th>Driver Name</th>
                        <th>Date</th>
                        <th>Amount</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- Payment records will be inserted here -->
                </tbody>
            </table>
        </div>

        <div class="payment-summary">
            <h3>Payment Summary</h3>
            <p>Total Payments: <span id="totalPayments">0</span></p>
            <p>Total Amount: <span id="totalAmount">$0.00</span></p>
        </div>
    </div>
</body>
</html>
