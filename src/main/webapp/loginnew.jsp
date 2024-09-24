<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Transport Management System</title>
    <style>
    .spinner {
            display: none;
            position: fixed;
            z-index: 999;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            border: 16px solid #f3f3f3;
            border-top: 16px solid #3498db;
            border-radius: 50%;
            width: 80px;
            height: 80px;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        body {
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px; /* Fixed width for the form */
            text-align: center; /* Center text inside the container */
        }

        h2 {
            margin-bottom: 20px;
			color: white;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #5cb85c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
	$(document).ready(function() {
		$('#spinner').hide();
	});
	    function loginMeth(event){
	    	$('#spinner').show();
	        event.preventDefault(); // Prevent form submission

	        var email = document.getElementsByName('email')[0].value;
	        var pass  = document.getElementsByName('password')[0].value;

	        $.ajax({
	            url: 'http://localhost:8084/login/user?email='+email+'&pass='+pass,
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	            	$('#spinner').hide();
	                if(response.message === "success"){
						window.location.href = 'dashboard.jsp'; 
						}else{
							alert(response.message);
							}
					
	            },
	            error: function(xhr, status, error) {
	                $('#result').html('Error: ' + error);
	            }
	        });
	    }
	</script>
	</head>
	<body style="background-image: url('img/bk4.jpg'); background-position: center;">
	 <!-- Spinner -->
    <div class="spinner" id="spinner"></div>
	    <div class="container" style="background-image: url('img/bk4.jpg'); background-position: center;">
	        <h2>Login</h2>

	        <form style="background-image: url('img/bk4.jpg'); background-position: center;" action="" method="post" onsubmit="loginMeth(event)">
	            <input type="text" name="email" placeholder="email" required>
	            <input type="password" name="password" placeholder="Password" required>
	            <button type="submit">Login</button>
	        </form>
	        <div id="result"></div>
	    </div>
	</body>
	</html>
