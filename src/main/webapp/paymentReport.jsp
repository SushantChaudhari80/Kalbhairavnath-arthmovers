<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment History</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        h1, h2 {
            text-align: center;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #2980b9;
            color: white;
        }
        .container {
            max-width: 1200px;
            margin: auto;
        }
        #totalPayment {
            color: #2980b9;
            font-weight: bold;
        }
    </style>
    <!-- Include jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
	 <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
</head>
<body>
    <div class="container">
        <h1>Total Payment: <span id="totalPayment">0</span></h1>

        <h2>Payment History Table 1</h2>
        <table id="table1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Customer Name</th>
                    <th>Machine Number</th>
                    <th>Start Reading</th>
                    <th>End Reading</th>
                    <th>Total Payment</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>

        <h2>Payment History Table 2</h2>
        <table id="table2">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Date</th>
                    <th>Customer Name</th>
                    <th>Selected Vehicle</th>
                    <th>Soil Brass</th>
                    <th>Soil Rate</th>
                    <th>Total Payment</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>

    <script>
		function getQueryParameter(param) {
				        const urlParams = new URLSearchParams(window.location.search);
				        return urlParams.get(param);
				    }

        // Use jQuery to execute the code when the document is ready
        $(document).ready(function () {
			const table1 = $('#table1').DataTable({
			          columns: [
			              { title: "ID" },
			              { title: "Date" },
			              { title: "Customer Name" },
						{ title: "Machine Number" },
						{ title: "Start Reading" },
						{ title: "End Reading" },
						{ title: "Total Payment" }
			            
			          ]
			      });
				  const table2 = $('#table2').DataTable({
				  			          columns: [
				  			              { title: "ID" },
				  			              { title: "Date" },
				  			              { title: "Customer Name" },
				  						{ title: "Selected Vehicle" },
				  						{ title: "Soil Brass" },
				  						{ title: "Soil Rate" },
				  						{ title: "Total Payment" }
				  			            
				  			          ]
				  			      });
            // AJAX call to fetch data
			const customerName = getQueryParameter('customerName');
            $.ajax({
                url: '/api/payment/getAll/byCustomerName?cName='+customerName,
                type: 'GET',
                dataType: 'json',
                success: function (data) {
                    // Destructure data into two arrays
                    const [table1Data, table2Data] = data;

                    let totalPaymentSum = 0;

                    // Populate Table 1
                    let table1Total = 0;
					table1.clear();
                    table1Data.forEach(function (item) {
						table1.row.add([
						              item.id,
						              item.date || '',
						              item.customer_name || '',
									  item.machine_number || '',
									  item.start_reading || '',
									  item.end_reading || '',
									  item.total_payment || '',
						]);
                        table1Total += parseFloat(item.total_payment);
                    });
					table1.draw();
                    // Populate Table 2
                    let table2Total = 0;
                    table2Data.forEach(function (item) {
						table2.row.add([
								item.id,
								item.date || '',
								item.customer_name || '',
								item.selected_vehicle || '',
								item.soil_brass || '',
								item.soil_rate || '',
								item.total_payment || '',
							]);
                        table2Total += parseFloat(item.total_payment);
                    });
					table2.draw();
                    // Calculate and display the total payment sum
                    totalPaymentSum = table1Total + table2Total;
                    $('#totalPayment').text(totalPaymentSum.toFixed(2));
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching data:', error);
                }
            });
        });
    </script>
</body>
</html>
