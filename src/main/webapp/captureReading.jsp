<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Machine Reading Form</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f7fa;
        }

        .form-container {
            max-width: 500px;
            margin: 0 auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #4a76a8;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: 500;
            color: #333;
        }

        input[type="text"], input[type="file"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 14px;
        }

        .checkbox-group {
            display: flex;
            gap: 20px;
        }

        .btn-submit {
            width: 100%;
            padding: 10px;
            background-color: #4a76a8;
            color: #ffffff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #3d5a80;
        }
    </style>
</head>
<body>

<div class="form-container">
    <h2>Machine Reading Form</h2>
    <form id="machineReadingForm" action="/upload" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="driverMobile">Driver Mobile Number:</label>
            <input type="text" id="driverMobile" name="driverMobile" placeholder="Enter Driver Mobile Number" required>
        </div>

        <div class="form-group">
            <label for="ownerMobile">Owner Mobile Number:</label>
            <input type="text" id="ownerMobile" name="ownerMobile" placeholder="Enter Owner Mobile Number" required>
        </div>

        <div class="form-group">
            <label for="machineNumber">Machine Number:</label>
            <input type="text" id="machineNumber" name="machineNumber" placeholder="Enter Machine Number" required>
        </div>

        <div class="form-group">
            <label>Reading Type:</label>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="readingType" value="startReading" id="startReading"> Start Reading
                </label>
                <label>
                    <input type="checkbox" name="readingType" value="endReading" id="endReading"> End Reading
                </label>
            </div>
        </div>

        <div class="form-group">
            <label for="photo">Upload Photo:</label>
            <input type="file" id="photo" name="photo" accept="image/*" required>
        </div>

        <button type="submit" class="btn-submit">Submit</button>
    </form>
</div>

</body>
</html>
