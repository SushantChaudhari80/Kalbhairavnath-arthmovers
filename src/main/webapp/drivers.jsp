<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Drivers Page</title>
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
            cursor: pointer;
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

        /* Drivers Grid */
        .drivers-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
        }

        .driver-card {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s;
        }

        .driver-card:hover {
            transform: translateY(-5px);
        }

        .driver-card img {
            border-radius: 50%;
            width: 80px;
            height: 80px;
            margin-bottom: 10px;
        }

        .driver-card h3 {
            font-size: 20px;
            margin-bottom: 10px;
        }

        .driver-card p {
            color: #7f8c8d;
            margin-bottom: 15px;
        }

        .driver-status {
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 14px;
            text-align: center;
            display: inline-block;
        }

        .status-available {
            background-color: #2ecc71;
            color: white;
        }

        .status-on-duty {
            background-color: #f39c12;
            color: white;
        }

        .status-off-duty {
            background-color: #e74c3c;
            color: white;
        }

        /* Modal for Driver Details */
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
            <h1>Drivers</h1>
            <button class="btn">Add New Driver</button>
        </div>

        <!-- Filters Section -->
        <div class="filters">
            <select>
                <option value="">Filter by Status</option>
                <option value="available">Available</option>
                <option value="on-duty">On Duty</option>
                <option value="off-duty">Off Duty</option>
            </select>
            <input type="text" placeholder="Search by Driver Name">
            <button>Apply Filters</button>
        </div>

        <!-- Drivers Grid -->
        <div class="drivers-grid">
            <div class="driver-card" onclick="openModal('Driver 01')">
                <img src="https://via.placeholder.com/80" alt="Driver">
                <h3>Driver 01</h3>
                <p>Assigned to Vehicle: Truck 01</p>
                <span class="driver-status status-available">Available</span>
            </div>
            <div class="driver-card" onclick="openModal('Driver 02')">
                <img src="https://via.placeholder.com/80" alt="Driver">
                <h3>Driver 02</h3>
                <p>Assigned to Vehicle: Van 02</p>
                <span class="driver-status status-on-duty">On Duty</span>
            </div>
            <div class="driver-card" onclick="openModal('Driver 03')">
                <img src="https://via.placeholder.com/80" alt="Driver">
                <h3>Driver 03</h3>
                <p>Assigned to Vehicle: SUV 03</p>
                <span class="driver-status status-off-duty">Off Duty</span>
            </div>
            <div class="driver-card" onclick="openModal('Driver 04')">
                <img src="https://via.placeholder.com/80" alt="Driver">
                <h3>Driver 04</h3>
                <p>Assigned to Vehicle: Truck 02</p>
                <span class="driver-status status-available">Available</span>
            </div>
        </div>

        <!-- Modal for Driver Details -->
        <div class="modal" id="driverModal">
            <div class="modal-content">
                <span class="modal-close" onclick="closeModal()">x</span>
                <div class="modal-header">
                    <h2>Driver Details</h2>
                </div>
                <div class="modal-body">
                    <p>Name: Driver 01</p>
                    <p>Vehicle Assigned: Truck 01</p>
                    <p>Status: Available</p>
                    <p>Last Trip: 2024-09-12</p>
                    <p>Contact: +123456789</p>
                </div>
            </div>
        </div>

    </div>

    <!-- JavaScript for Modal -->
    <script>
        function openModal(driverName) {
            document.getElementById('driverModal').style.display = 'flex';
            document.querySelector('.modal-header h2').innerText = driverName + ' Details';
        }

        function closeModal() {
            document.getElementById('driverModal').style.display = 'none';
        }
    </script>

</body>
</html>
