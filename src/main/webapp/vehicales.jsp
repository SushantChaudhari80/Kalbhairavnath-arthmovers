<!DOCTYPE html>
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
            color: black;
            margin-bottom: 15px;
        }
        .vehicle-card {
		    border: 1px solid red;  /* Temporary border to see the vehicle cards */
		    background-color: white;
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
           .machineNumberStyle {
			    background-color: #f0ad4e;  /* Amber color for machine number */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
			}
			
			.companyStyle {
			    background-color: #5bc0de;  /* Light blue background for company name */
			    color: #fff;                /* White text to contrast */
			    padding: 10px;              /* Padding around the text */
			    border-radius: 5px;         /* Rounded corners */
			    text-align: center;         /* Center the text */
			}

        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		    $(document).ready(function() {
		        // Function to fetch customer data from server using AJAX
		        function fetchVehicalesList() {
		            $.ajax({
		                url: '/api/vehicles/getAll',  // URL for fetching the customer data
		                type: 'GET',
		                success: function(vehicles) {
		                	$('#vehicaleList').empty();
		                    vehicles.forEach(function(vehicle) {
		                    	var no =  vehicle.machineNumber.toString() ;
			                    var company = vehicle.company.toString();
			                    console.log( no, company);
		                        $('#vehicaleList').append(`
		                            <div class="vehicle-card">
		                                <h3 class="machineNumberStyle">${no}</h3>  <!-- ${vehicle.machineNumber}-->
		                                <p class="companyStyle">${company}</p>  <!--${vehicle.company || "Unknown Company"} -->
		                            </div>
		                        `);
		                    });

		                },
		                error: function(xhr, status, error) {
		                    console.error("Error fetching customer data:", error);
		                }
		            });
		        }
		
		        // Call the function to load customer data when the page is ready
		        fetchVehicalesList();
		    });
		    
		</script>
</head>
<body>

    <div class="container">
        <!-- Page Header -->
        <div class="page-header">
            <h1>Vehicles</h1>
            <a href="addVehicale.jsp" class="btn">Add New Vehicle</a>
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
        <div id="vehicaleList" class="vehicles-grid">
		    <div class="vehicle-card">
		            <h3 id="machinNumber">Loading..</h3>
		            <p id="machinCompany">Loading..</p>
		        </div>
		   
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
