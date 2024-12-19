<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Machine Reading</title>
    <style>
        /* General Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(to right, #6a11cb, #2575fc);
            color: #fff;
            font-size: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 2rem;
        }

        form {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 100%;
            max-width: 500px;
        }

        form div {
            margin-bottom: 15px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            outline: none;
            background: rgba(255, 255, 255, 0.9);
            color: #333;
            font-size: 1rem;
        }

        input[type="text"]:focus {
            border: 2px solid #2575fc;
        }

        img {
            display: block;
            max-width: 200px;
            border-radius: 5px;
            margin: 10px 0;
        }

        button {
            width: 100%;
            padding: 10px;
            border: none;
            border-radius: 5px;
            background: #2575fc;
            color: #fff;
            font-size: 1rem;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        button:hover {
            background: #6a11cb;
        }

        @media (max-width: 768px) {
            form {
                padding: 15px;
            }

            h2 {
                font-size: 1.5rem;
            }

            input[type="text"], button {
                font-size: 0.9rem;
            }
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="readingUpdateForm">
        <h2>Update Machine Reading</h2>

        <div>
            <label for="startReadingImgPreview">Start Reading Image:</label>
            <img id="startReadingImgPreview" src="https://via.placeholder.com/200" alt="Start Reading Image">
        </div>
		<div>
		    <label for="startReading">Start Reading:</label>
		    <input type="text" id="startReading" name="startReading" required>
		</div>

        <div>
            <label for="endReadingImgPreview">End Reading Image:</label>
            <img id="endReadingImgPreview" src="https://via.placeholder.com/200" alt="End Reading Image">
        </div>
		<div>
		    <label for="endReading">End Reading:</label>
		    <input type="text" id="endReading" name="endReading" required>
		</div>

        <div>
            <label for="dieselImgPreview">Diesel Image:</label>
            <img id="dieselImgPreview" src="https://via.placeholder.com/200" alt="Diesel Image">
        </div>
		<div>
		    <label for="diesel">Diesel:</label>
		    <input type="text" id="diesel" name="diesel" required>
		</div>

        <button type="submit">Update Reading</button>
    </form>

    <script>
        $(document).ready(function () {
            const readingId = 3; // Example reading ID
            
            // Fetch data using AJAX
            $.ajax({
                url: '/admin/reading/getById',
                method: 'GET',
                dataType: 'json',
				data:{"id":readingId},
                success: function (data) {
					console.log(data);
					
                    if (data.startReading) {
                        $('#startReadingImgPreview').attr('src', 'data:image/jpeg;base64,'+data.startReading);
                    }
                    if (data.endReading) {
						$('#endReadingImgPreview').attr('src', 'data:image/jpeg;base64,'+data.startReading);
                    }
                    if (data.disel) {
						$('#dieselImgPreview').attr('src', 'data:image/jpeg;base64,'+data.startReading);
                    }
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching data:', error);
                    alert('Failed to load reading data.');
                }
            });

            // Submit data using AJAX
            $('#readingUpdateForm').on('submit', function (e) {
                e.preventDefault();
                
                const formData = new FormData(this);
                     formData.append('id', readingId);
                $.ajax({
                    url: '/admin/reading',
                    method: 'PUT',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (data) {
                        alert('Reading updated successfully!');
                    },
                    error: function (xhr, status, error) {
                        console.error('Error updating reading:', error);
                        alert('Error updating reading. Please try again.');
                    }
                });
            });
        });
    </script>
</body>
</html>


