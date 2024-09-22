<!DOCTYPE html>
<%@page import="com.sushant.live.Config"%>
<%@page import="com.sushant.live.model.Vehicale"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transport Vehicles Page</title>
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

        /* Vehicles Section */
        .vehicles-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .vehicle-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .vehicle-card:hover {
            transform: translateY(-5px);
        }

        .vehicle-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .vehicle-card p {
            color: #7f8c8d;
            margin-bottom: 15px;
        }

        .vehicle-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .status-active {
            background-color: #2ecc71;
            color: white;
        }

        .status-maintenance {
            background-color: #e67e22;
            color: white;
        }

        .status-unavailable {
            background-color: #e74c3c;
            color: white;
        }

        /* Modal for Detailed View */
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
            <h1>Vehicles</h1>
            <a href="#" class="btn">Add New Vehicle</a>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Status</option>
                <option value="active">Active</option>
                <option value="maintenance">Maintenance</option>
                <option value="unavailable">Unavailable</option>
            </select>
            <input type="text" placeholder="Search by Vehicle Name">
            <button>Apply Filters</button>
        </div>

        <!-- Vehicles Grid -->
        <div class="vehicles-grid">
        
        <%
        List<Vehicale> list = Config.getDatasource().findAll();
        for (int i=0 ;  i<list.size();i++ ){
        	Vehicale v = list.get(i);
       
        %>
            <div class="vehicle-card">
                <h3><% v.getMachineNumber(); %></h3>
                <p><% v.getCompany(); %></p>
            </div>
           <% } %>
        </div>

        <!-- Modal for Vehicle Details -->
        <div class="modal" id="vehicleModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Vehicle 01 Details</h2>
                </div>
                <div class="modal-body">
                    <p>Type: Truck</p>
                    <p>Status: Active</p>
                    <p>Last Serviced: 2024-08-01</p>
                    <p>License Plate: ABC-1234</p>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal() {
            document.getElementById('vehicleModal').style.display = 'flex';
        }

        function closeModal() {
            document.getElementById('vehicleModal').style.display = 'none';
        }
    </script>

</body>
</html>
