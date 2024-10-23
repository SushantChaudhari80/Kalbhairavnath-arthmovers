<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body, html {
            font-family: 'Poppins', sans-serif;
            height: 100%;
            background-image: url('img/bk6.jpg');
        }
        
        /* Basic Layout */
        .dashboard-container {
            display: flex;
            height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 250px;
            background-color: #2C3E50;
            color: white;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            padding: 20px;
        }

        .sidebar h2 {
            font-size: 24px;
            font-weight: 500;
            color: #ecf0f1;
            margin-bottom: 20px;
        }

        .nav-links {
            list-style: none;
        }

        .nav-links li {
            margin-bottom: 20px;
        }

        .nav-links li a {
            text-decoration: none;
            color: #bdc3c7;
            font-size: 16px;
            display: flex;
            align-items: center;
        }

        .nav-links li a:hover {
            color: #ecf0f1;
        }

        /* Header */
        .header {
            width: 100%;
            height: 60px;
            background-color: #fff;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 20px;
            border-bottom: 1px solid #ddd;
        }

        .header .search-bar input {
            padding: 10px;
            width: 250px;
            border-radius: 4px;
            border: 1px solid #ddd;
        }

        .header .user-section {
            display: flex;
            align-items: center;
        }

        .header .user-section img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-left: 15px;
        }

        /* Main Content */
        .main-content {
            width: 100%;
            padding: 20px;
        }

        .main-content h1 {
            font-size: 28px;
            font-weight: 500;
            margin-bottom: 20px;
        }

        /* Overview Section */
        .overview {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            text-align: center;
        }

        .card h3 {
            font-size: 22px;
            margin-bottom: 10px;
        }

        .card p {
            font-size: 18px;
            color: #7f8c8d;
        }

        /* Orders Table */
        .orders-section {
            margin-top: 30px;
        }

        .orders-section h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #2980b9;
            color: white;
        }

        table th, table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        table tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
            }

            .sidebar {
                width: 100%;
                height: auto;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            .main-content {
                padding: 10px;
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
    
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		    $(document).ready(function() {
				$('.spinner-container').show();
		        // Function to fetch customer data from server using AJAX
		        function fetchCustomerData() {
		            $.ajax({
		                url: '/api/customers/get',  // URL for fetching the customer data
		                type: 'GET',
		                success: function(customer) {
		                    // Update the UI with the customer data
		                    $('#customer-name').text(customer.name);
		                    if (customer.picture) {
		                        var imageUrl = 'data:image/png;base64,' + customer.picture;
		                        $('#customer-picture').attr('src', imageUrl);
		                    }
							$('.spinner-container').hide();
		                },
		                error: function(xhr, status, error) {
		                    console.error("Error fetching customer data:", error);
		                }
		            });
		        }
		
		        // Call the function to load customer data when the page is ready
		        fetchCustomerData();
		    });
		</script>
</head>
<body>
	<div class="spinner-container">
        <div class="spinner"></div>
	</div>
   <div class="dashboard-container">
        <!-- Sidebar -->
        <div class="sidebar">
            <div>
                <h2>Transport</h2>
                <ul class="nav-links">
                    <li><a href="dashboard.jsp">Dashboard</a></li>
                    <li><a href="order.jsp">Orders</a></li>
                    <li><a href="vehicales.jsp">Vehicles</a></li>
                    <li><a href="drivers.jsp">Drivers</a></li>
					<li><a href="reports.jsp">Reports</a></li>
					<li><a href="orderReport.jsp">Order Report</a></li>
					<li><a href="dieselReport.jsp">Diesel Report</a></li>
					<li><a href="invoices.jsp">Invoices</a></li>
                </ul>
            </div>
            <div class="footer">
                <p>&copy; Tanvi Enterprices</p>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <!-- Header -->
           
            <div class="header">
			    <div class="search-bar">
			        <input type="text" placeholder="Search...">
			    </div>
			    <div class="user-section">
			        <span id="customer-name">Loading....</span>
			        <img id="customer-picture" src="https://via.placeholder.com/40" alt="User Profile">
			    </div>
			</div>

            <!-- Overview Section -->
            <h1 style="color: white;">Dashboard Overview</h1>
            <div class="overview">
                <div class="card">
                    <h3>Total Orders</h3>
                    <p>256</p>
                </div>
                <div class="card">
                    <h3>Vehicles in Use</h3>
                    <p>32</p>
                </div>
                <div class="card">
                    <h3>Active Deliveries</h3>
                    <p>14</p>
                </div>
                <div class="card">
                    <h3>Pending Issues</h3>
                    <p>5</p>
                </div>
            </div>

            <!-- Orders Section -->
            <div class="orders-section">
                
            </div>
        </div>
    </div>
</body>
</html>
