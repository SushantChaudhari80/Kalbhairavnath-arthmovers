<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Orders Page</title>
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
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Orders</h1>
            <a href="#" class="btn">Add New Order</a>
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
        <table>
            <thead>
                <tr>
                    <th>Order ID</th>
                    <th>Customer Name</th>
                    <th>Status</th>
                    <th>Delivery Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>#001</td>
                    <td>John Smith</td>
                    <td><span class="status delivered">Delivered</span></td>
                    <td>2024-09-18</td>
                    <td class="actions"><button onclick="openModal()">View</button></td>
                </tr>
                <tr>
                    <td>#002</td>
                    <td>Jane Doe</td>
                    <td><span class="status pending">Pending</span></td>
                    <td>2024-09-20</td>
                    <td class="actions"><button onclick="openModal()">View</button></td>
                </tr>
                <tr>
                    <td>#003</td>
                    <td>Bob Johnson</td>
                    <td><span class="status canceled">Canceled</span></td>
                    <td>2024-09-15</td>
                    <td class="actions"><button onclick="openModal()">View</button></td>
                </tr>
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

    <!-- JavaScript for Modal -->
    <script>
        function openModal() {
            document.getElementById('orderModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('orderModal').style.display = 'none';
        }
    </script>

</body>
</html>
