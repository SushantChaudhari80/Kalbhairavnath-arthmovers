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
            display: flex;
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
</head>
<body>

    <div class="container">
        <h1>Invoices Report</h1>

        <!-- Filters Section -->
        <div class="filters">
            <div class="filter-item">
                <label for="invoiceNumber">Invoice Number</label>
                <input type="text" id="invoiceNumber" placeholder="Enter invoice number">
            </div>
            <div class="filter-item">
                <label for="startDate">Start Date</label>
                <input type="date" id="startDate">
            </div>
            <div class="filter-item">
                <label for="endDate">End Date</label>
                <input type="date" id="endDate">
            </div>
            <div class="filter-item">
                <label for="status">Status</label>
                <select id="status">
                    <option value="all">All</option>
                    <option value="paid">Paid</option>
                    <option value="unpaid">Unpaid</option>
                    <option value="overdue">Overdue</option>
                </select>
            </div>
            <button class="btn-filter">Filter</button>
        </div>

        <!-- Actions Section (Export, Print) -->
        <div class="actions">
            <button onclick="exportCSV()">Export CSV</button>
            <button onclick="printReport()">Print</button>
        </div>

        <!-- Summary Section -->
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
        <table>
            <thead>
                <tr>
                    <th>Invoice Number</th>
                    <th>Date</th>
                    <th>Status</th>
                    <th>Amount</th>
                    <th>Due Date</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <!-- Dynamic rows will be inserted here -->
                <tr>
                    <td>INV-12345</td>
                    <td>2024-10-01</td>
                    <td>Paid</td>
                    <td>$500.00</td>
                    <td>2024-10-15</td>
                    <td><button>View</button></td>
                </tr>
                <tr>
                    <td>INV-12346</td>
                    <td>2024-10-05</td>
                    <td>Unpaid</td>
                    <td>$600.00</td>
                    <td>2024-10-20</td>
                    <td><button>View</button></td>
                </tr>
            </tbody>
        </table>

        <!-- Pagination Section -->
        <div class="pagination">
            <a href="#" class="active">1</a>
            <a href="#">2</a>
            <a href="#">3</a>
            <a href="#">Next</a>
        </div>

    </div>

    <script>
        function exportCSV() {
            // Add functionality for exporting the table data to CSV
            alert('Export CSV functionality will be added here.');
        }

        function printReport() {
            // Add functionality for printing the report
            window.print();
        }
    </script>

</body>
</html>
