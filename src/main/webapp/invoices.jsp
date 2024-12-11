<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Invoices</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
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
            display: none;
            justify-content: space-between;
            margin-bottom: 20px;
            flex-wrap: wrap;
        }

        .filters .filter-item {
            display: flex;
            flex-direction: column;
            margin-right: 15px;
            margin-bottom: 15px;
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
        
        .actions {
            display: flex;
            justify-content: flex-end;
            margin-bottom: 20px;
        }

        .actions button {
            background-color: #34495e;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-left: 10px;
        }

        .actions button:hover {
            background-color: #2c3e50;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<!-- Include DataTables CSS -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	<!-- Include DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	<script>
	
		$(document).ready(function () {
		    const table = $('#invoiceTable').DataTable({
		        columns: [
		            { title: "Customer Name" },
		            { title: "Paid Amt" },
		            { title: "Pending Amt" },
		            { title: "Total Due Amt" },
		            { title: "Due Date" },
		            { title: "Actions" }
		        ]
		    });

		    function fetchInvoiceList() {
		        $.ajax({
		            url: '/api/payment/getAll/customer',
		            type: 'GET',
		            success: function (invoices) {
		                table.clear(); // Clear existing data in the table

		                // Fetch additional data for each customer
		                const fetchDetailsPromises = invoices.map(invoice =>
						  // var totalAmt =0;
						 //  $.ajax({
						  // 		     url: '/api/payment/getAll/customer',
						  // 		     type: 'GET',
						 // 		     success: function (readings) {
							//		    },
							//		 error: function (xhr, status, error) {
						//				console.error("Error fetching customer list:", error);
							//			alert('Failed to fetch customer list. Please try again.');
							//		}
												
		                    $.ajax({
		                        url: `/api/invoice/getTotalPaid?cName=`+invoice, // Safely encode customer names
		                        type: 'GET'
		                    }).then(amt => {
		                        return [
		                            invoice || 'N/A',   // Customer Name
		                            amt || '0',         // Paid Amount
		                             '',                 // Pending Amount (placeholder)
		                            '',                 // Total Due Amount (placeholder)
		                            'N/A',              // Due Date (placeholder)
		                            '<button class="btn btn-primary">View</button>' // Actions
		                        ];
		                    }).catch(error => {
		                        console.error(`Error fetching data for ${invoice}:`, error);
		                        return [
		                            invoice || 'N/A',
		                            'Error',
		                            'Error',
		                            'Error',
		                            'Error',
		                            '<button class="btn btn-danger disabled">Error</button>'
		                        ];
		                    })
		                );

		                // Wait for all promises to resolve
		                Promise.all(fetchDetailsPromises).then(rows => {
		                    rows.forEach(row => table.row.add(row));
		                    table.draw(); // Render the table after adding all rows
		                });
		            },
		            error: function (xhr, status, error) {
		                console.error("Error fetching customer list:", error);
		                alert('Failed to fetch customer list. Please try again.');
		            }
		        });
		    }

		    fetchInvoiceList();
		});


	</script>
	
</head>
<body>

    <div class="container">
        <h1>Invoices Report</h1>
        <div class="summary">
            <div class="summary-item">
                <h3 id="totalInvoices">0</h3>
                <p>Total Invoices</p>
            </div>
            <div class="summary-item">
                <h3 id="paidInvoices">0</h3>
                <p>Paid Invoices</p>
            </div>
            <div class="summary-item">
                <h3 id="unpaidInvoices">0</h3>
                <p>Unpaid Invoices</p>
            </div>
            <div class="summary-item">
                <h3 id="totalAmount">$0.00</h3>
                <p>Total Amount</p>
            </div>
        </div>

        <!-- Invoices Table -->
        <table  id="invoiceTable" class="display">
            <thead>
                <tr>
                    <th>Customer Name</th>
                    <th>Paid Amt</th>
                    <th>Pending Amt</th>
                    <th>Total Due Amt</th>
                    <th>Due Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
             
            </tbody>
        </table>
    </div>

    <script>

    </script>

</body>
</html>
