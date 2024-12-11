<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Customer Information Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <style>
        /* Reset some basic styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 150vh;
            overflow: auto; /* Ensure scrolling if content overflows */
        }

        .container {
            width: 100%;
            max-width: 600px;
            padding: 20px;
            margin: 0 auto;
        }

        .form-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            gap: 15px; /* Add spacing between elements */
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 28px;
            color: #333;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin-bottom: 5px;
            font-size: 16px;
        }

        input[type="text"],
        textarea,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
        }

        input[type="text"]:focus,
        textarea:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
        }

        textarea {
            resize: none;
        }

        .submit-btn {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            border: none;
            color: white;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .submit-btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .form-container {
                padding: 20px;
            }

            h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-container">
            <h1>Customer Information</h1>
            <form action="/api/customers/add" method="POST" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="mobile">Mobile Number</label>
                    <input type="text" id="mobile" name="mobile" placeholder="Enter mobile number" required pattern="[0-9]{10}" title="Enter a valid 10-digit mobile number">
                </div>

                <div class="form-group">
                    <label for="name">Owner Name</label>
                    <input type="text" id="name" name="name" placeholder="Enter full name" required>
                </div>

                <div class="form-group">
                    <label for="bussinessName">Business Name</label>
                    <input type="text" id="bussinessName" name="bussinessName" placeholder="Enter Business name" required>
                </div>

                <div class="form-group">
                    <label for="gstNo">GST No</label>
                    <textarea id="gstNo" name="gstNo" placeholder="Enter GST number"></textarea>
                </div>

                <div class="form-group">
                    <label for="acNo">Bank Account Number</label>
                    <input type="text" id="acNo" name="acNo" placeholder="Bank Account Number" required>
                </div>

                <div class="form-group">
                    <label for="ifsc">IFSC Code</label>
                    <input type="text" id="ifsc" name="ifsc" placeholder="Bank IFSC Number" required>
                </div>

                <div class="form-group">
                    <label for="bankName">Bank Name</label>
                    <input type="text" id="bankName" name="bankName" placeholder="Bank Name" required>
                </div>

                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" placeholder="Enter address"></textarea>
                </div>

                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="text" id="password" name="password" placeholder="Enter password" required>
                </div>

                <div class="form-group">
                    <label for="picture">Upload Picture</label>
                    <input type="file" id="picture" name="picture" accept="image/*">
                    <small style="font-size: 12px; color: #666;">(Accepts images up to 5MB)</small>
                </div>

                <div class="form-group">
                    <button type="submit" class="submit-btn">Submit</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
