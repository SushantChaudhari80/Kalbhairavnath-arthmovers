<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Orders Page</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
	<%@ page import="com.sushant.live.service.OrderService" %>
	<style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body, html {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f6f9;
        }

        /* Basic Layout */
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

        .status.delivered {
            background-color: #2ecc71;
            color: white;
        }

        .status.pending {
            background-color: #e67e22;
            color: white;
        }

        .status.canceled {
            background-color: #e74c3c;
            color: white;
        }

        .actions button {
            padding: 5px 10px;
            background-color: #3498db;
            border: none;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        .actions button:hover {
            background-color: #2980b9;
        }

        /* Order Details Modal */
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

	   <!-- Include DataTables CSS -->
	   <link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">

	   <!-- Include DataTables JavaScript -->
	   <script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
	   <script>
	       function openModal() {
	           document.getElementById('orderModal').style.display = 'flex';
	       }

	       function closeModal() {
	           document.getElementById('orderModal').style.display = 'none';
	       }

	       $(document).ready(function() {
			$('.spinner-container').show();
			// Initialize DataTable when the document is ready
			        const table = $('#orderTable').DataTable({
						columns: [
						               { title: "ID" },
						               { title: "Customer Name" },
						               { title: "Status" },
						               { title: "Delivery Date" },
						               { title: "Machines" },
						               { title: "Actions" }
						           ]
			        });
	           // Function to fetch order data from server using AJAX
	           fetchOrders();

	           // Example: Adding event listener to handle button actions (View/Delete)
	           $(document).on('click', '.view-details-btn', function() {
	               var orderId = $(this).data('id');
	               alert('View details for order ID: ' + orderId);
	               // You can implement a modal or redirect logic here
	           });

	           $(document).on('click', '.delete-order-btn', function() {
	               var orderId = $(this).data('id');
	               alert('Delete order ID: ' + orderId);
	               // Add logic to delete the order via API
	           });
	       });
		   
		  
		   function fetchOrders() {
		          $.ajax({
		              url: '/api/order/getAll', // Replace with your actual API URL
		              type: 'GET',
		              success: function (orders) {
		                  const table = $('#orderTable').DataTable(); // Ensure the DataTable is initialized
		                  table.clear(); // Clear existing rows
                        console.log(orders);
		                  orders.forEach(function (order) {
							// Ensure these properties exist in each order object
							                   table.row.add([
							                       order.id || '', // Ensure fallback value if undefined
							                       order.customer_name || '',
							                       order.status || '',
							                       order.deliveryDate || '',
							                       order.machins || '',
							                       `<button class="view-details-btn" data-id="${order.id}">View</button>
							                        <button class="delete-order-btn" data-id="${order.id}">Delete</button>
							                        <button class="update-order-btn" data-id="${order.id}">Update</button>`
							                   ]);
		                  });

		                  table.draw(false); // Draw the table once all rows are added
		                  $('.spinner-container').hide(); // Hide the spinner
		              },
		              error: function (xhr, status, error) {
		                  console.error("Error fetching orders:", error);
		              }
		          });
		      }
	 

	   </script>
</head>
<body>
	<div class="spinner-container">
				    <div class="spinner"></div>
				</div>

    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Orders</h1>
            <a href="addOrder.jsp" class="btn">Add New Order</a>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Status</option>
                <option value="delivered">Delivered</option>
                <option value="pending">Pending</option>
                <option value="canceled">Canceled</option>
            </select>
            <input type="date" placeholder="From Date">
            <input type="date" placeholder="To Date">
            <button>Apply Filters</button>
        </div>

        <!-- Orders Table -->
        <table id="orderTable" class="display">
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Status</th>
                    <th>Vehicle Numbers</th>
                    <th>Delivery Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody id="orderTableBody">
                 

        </tbody>
        </table>

        <!-- Modal for Order Details -->
        <div class="modal" id="orderModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Order #001 Details</h2>
                </div>
                <div class="modal-body">
                    <p>Customer Name: John Smith</p>
                    <p>Order Status: Delivered</p>
                    <p>Delivery Date: 2024-09-18</p>
                    <p>Address: 123 Main St, New York, NY</p>
                </div>
            </div>
        </div>

    </div>
</body>
</html>
