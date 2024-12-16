
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dumper Quotation</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f4f4f4;
            color: #2c3e50;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .quotation-container {
            width: 80%;
            max-width: 800px;
            background: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .quotation-header {
            text-align: center;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .quotation-header h1 {
            font-size: 24px;
            font-weight: 600;
            color: #3498db;
        }

        .quotation-form {
            margin-bottom: 20px;
        }

        .quotation-form label {
            font-size: 16px;
            margin-bottom: 5px;
            display: block;
            font-weight: 500;
        }

        .quotation-form input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #2c3e50;
        }

        .quotation-summary {
            margin-top: 20px;
        }

        .quotation-summary h2 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .quotation-summary table {
            width: 100%;
            border-collapse: collapse;
        }

        .quotation-summary table th,
        .quotation-summary table td {
            padding: 12px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .quotation-summary table th {
            background: #3498db;
            color: #fff;
            font-weight: 600;
        }

        .quotation-summary table td {
            background: #f9f9f9;
        }

        .print-btn {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            background-color: #3498db;
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .print-btn:hover {
            background-color: #2980b9;
        }

        /* Print-only styles */
        @media print {
            body * {
                visibility: hidden;
            }

            #quotation-summary, #quotation-summary * {
                visibility: visible;
            }

            #quotation-summary {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="quotation-container">
        <div class="quotation-header">
            <h1>Dumper Quotation</h1>
        </div>
        <form id="quotation-form" class="quotation-form">
            <label for="customer-name">Customer Name</label>
            <input type="text" id="customer-name" placeholder="Enter customer name">

            <label for="vehicle-number">Vehicle Number</label>
            <input type="text" id="vehicle-number" placeholder="Enter vehicle number">

            <label for="diesel">Diesel (Liters)</label>
            <input type="number" id="diesel" placeholder="Enter diesel in liters">

            <label for="advance">Advance Payment (₹)</label>
            <input type="number" id="advance" placeholder="Enter advance amount">

            <label for="soil-brass">Number of Brass Soil</label>
            <input type="number" id="soil-brass" placeholder="Enter number of brass">

            <label for="soil-rate">Soil Rate per Brass (₹)</label>
            <input type="number" id="soil-rate" placeholder="Enter rate per brass" value="1000">
        </form>

        <div class="quotation-summary" id="quotation-summary">
            <h2>Quotation Summary</h2>
            <table id="quotation-table">
                <thead>
                    <tr>
                        <th>Details</th>
                        <th>Values</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Customer Name</td>
                        <td id="summary-customer-name">-</td>
                    </tr>
                    <tr>
                        <td>Vehicle Number</td>
                        <td id="summary-vehicle-number">-</td>
                    </tr>
                    <tr>
                        <td>Diesel (Liters)</td>
                        <td id="summary-diesel">-</td>
                    </tr>
                    <tr>
                        <td>Advance Payment</td>
                        <td id="summary-advance">-</td>
                    </tr>
                    <tr>
                        <td>Total Soil (Brass)</td>
                        <td id="summary-soil-brass">-</td>
                    </tr>
                    <tr>
                        <td>Soil Rate per Brass</td>
                        <td id="summary-soil-rate">-</td>
                    </tr>
                    <tr>
                        <td>Total Payment (₹)</td>
                        <td id="summary-total-payment">-</td>
                    </tr>
                </tbody>
            </table>
        </div>

        <button class="print-btn" id="print-btn">Download as PDF</button>
    </div>

    <script>
        document.getElementById('quotation-form').addEventListener('input', function () {
            const customerName = document.getElementById('customer-name').value;
            const vehicleNumber = document.getElementById('vehicle-number').value;
            const diesel = document.getElementById('diesel').value;
            const advance = document.getElementById('advance').value;
            const soilBrass = document.getElementById('soil-brass').value;
            const soilRate = document.getElementById('soil-rate').value;

            // Calculate total payment
            const totalPayment = soilBrass * soilRate;

            // Update summary
            document.getElementById('summary-customer-name').innerText = customerName || '-';
            document.getElementById('summary-vehicle-number').innerText = vehicleNumber || '-';
            document.getElementById('summary-diesel').innerText = diesel || '-';
            document.getElementById('summary-advance').innerText = advance || '-';
            document.getElementById('summary-soil-brass').innerText = soilBrass || '-';
            document.getElementById('summary-soil-rate').innerText = soilRate || '-';
            document.getElementById('summary-total-payment').innerText = totalPayment || '-';
        });

        document.getElementById('print-btn').addEventListener('click', function () {
            window.print();
        });
    </script>
</body>
</html>
