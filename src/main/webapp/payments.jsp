<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order Payment Management</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f7fa;
            color: #34495e;
            padding: 20px;
        }

        h1, h2 {
            color: #2c3e50;
        }

        .container {
            max-width: 1200px;
            margin: auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background-color: #3498db;
            color: white;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: 600;
        }

        /* Layout */
        .layout {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            padding: 20px;
        }

        .add-payment, .payment-history {
            flex: 1;
            min-width: 300px;
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        }

        /* Add Payment Section */
        .add-payment h2 {
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .form-group input, .form-group select, .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
        }

        .form-group textarea {
            height: 100px;
            resize: none;
        }

        .form-group button {
            background-color: #27ae60;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .form-group button:hover {
            background-color: #229954;
        }

        /* Payment History Section */
        .payment-history h2 {
            margin-bottom: 20px;
        }

        .payment-list {
            margin-top: 10px;
        }

        .date-section {
            margin-bottom: 20px;
        }

        .date-header {
            background-color: #f1f1f1;
            padding: 10px;
            border-radius: 5px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
            font-weight: 500;
        }

        .date-header:hover {
            background-color: #eaeaea;
        }

        .date-payments {
            display: none;
            margin-top: 10px;
        }

        .payment-item {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            display: flex;
            justify-content: space-between;
        }

        .payment-item .amount {
            font-weight: bold;
            color: #2ecc71;
        }

        .payment-item .details {
            font-size: 14px;
            color: #7f8c8d;
        }

        .payment-item .timestamp {
            font-size: 12px;
            color: #95a5a6;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .layout {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Header -->
        <div class="header">Order Payment Management</div>

        <!-- Main Layout -->
        <div class="layout">
            <!-- Add Payment Section -->
            <div class="add-payment">
                <h2>Add Payment</h2>
                <form id="add-payment-form">
                    <div class="form-group">
                        <label for="order-id">Order ID</label>
                        <input type="text" id="order-id" name="orderId" placeholder="Enter Order ID" required>
                    </div>
                    <div class="form-group">
                        <label for="amount">Payment Amount</label>
                        <input type="number" id="amount" name="amount" placeholder="Enter Payment Amount" required>
                    </div>
                    <div class="form-group">
                        <label for="method">Payment Method</label>
                        <select id="method" name="method" required>
                            <option value="Cash">Cash</option>
                            <option value="Credit Card">Credit Card</option>
                            <option value="Bank Transfer">Bank Transfer</option>
                            <option value="UPI">UPI</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="note">Payment Note</label>
                        <textarea id="note" name="note" placeholder="Add any relevant notes..."></textarea>
                    </div>
                    <div class="form-group">
                        <button type="button" id="save-payment">Add Payment</button>
                    </div>
                </form>
            </div>

            <!-- Payment History Section -->
            <div class="payment-history">
                <h2>Payment History</h2>
                <div class="payment-list" id="payment-list">
                    <!-- Dynamic payment history will be displayed here -->
                </div>
            </div>
        </div>
    </div>

    <script>
		alert("This page is in development");
        const paymentListEl = document.getElementById('payment-list');
        const savePaymentBtn = document.getElementById('save-payment');

        // Sample Payment Data
        const paymentHistory = {
            '2024-12-01': [
                { amount: 200, method: 'Cash', note: 'Advance payment', timestamp: '10:30 AM' },
                { amount: 150, method: 'UPI', note: 'Remaining balance', timestamp: '03:15 PM' },
            ],
            '2024-12-02': [
                { amount: 300, method: 'Credit Card', note: 'Order #2345', timestamp: '02:00 PM' },
            ],
        };

        // Load Payment History
        function loadPaymentHistory() {
            paymentListEl.innerHTML = '';
            for (const date in paymentHistory) {
                const dateSection = document.createElement('div');
                dateSection.className = 'date-section';

                const dateHeader = document.createElement('div');
                dateHeader.className = 'date-header';
                dateHeader.textContent = date;

                const datePayments = document.createElement('div');
                datePayments.className = 'date-payments';

                paymentHistory[date].forEach(payment => {
                    const paymentItem = document.createElement('div');
                    paymentItem.className = 'payment-item';
                    paymentItem.innerHTML = `
                        <div>
                            <div class="amount">$${payment.amount}</div>
                            <div class="details">${payment.method} - ${payment.note}</div>
                        </div>
                        <div class="timestamp">${payment.timestamp}</div>
                    `;
                    datePayments.appendChild(paymentItem);
                });

                dateHeader.addEventListener('click', () => {
                    datePayments.style.display = datePayments.style.display === 'none' ? 'block' : 'none';
                });

                dateSection.appendChild(dateHeader);
                dateSection.appendChild(datePayments);
                paymentListEl.appendChild(dateSection);
            }
        }

        // Add New Payment
        savePaymentBtn.addEventListener('click', () => {
            const orderId = document.getElementById('order-id').value;
            const amount = document.getElementById('amount').value;
            const method = document.getElementById('method').value;
            const note = document.getElementById('note').value;

            const today = new Date().toISOString().split('T')[0];
            const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

            const newPayment = { amount: parseFloat(amount), method, note, timestamp: time };

            if (!paymentHistory[today]) paymentHistory[today] = [];
            paymentHistory[today].push(newPayment);

            loadPaymentHistory();
            alert('Payment added successfully!');
        });

        // Initial Load
        loadPaymentHistory();
    </script>
</body>
</html>
