<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Expires" content="0">
<link rel="icon" type="image/png" href="img/project_logo.png">
<title>Driver Login - Transport Management System</title>
<style>
.spinner-container {
	display: none; /* Hidden by default; show it when needed */
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
	backdrop-filter: blur(5px); /* Blur effect */
	z-index: 999; /* Above other elements */
	justify-content: center; /* Center spinner horizontally */
	align-items: center; /* Center spinner vertically */
}

.spinner {
	position: fixed;
	z-index: 999;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border: 5px solid #f3f3f3;
	border-top: 5px solid #3498db;
	border-radius: 50%;
	width: 30px;
	height: 30px;
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
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	width: 300px; /* Fixed width for the form */
	text-align: center; /* Center text inside the container */
	align-items: center;
}

h2 {
	margin-bottom: 20px;
	color: white;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	text-align: center;
}

input[type="submit"] {
	background-color: #5cb85c;
	width: 100%;
	padding: 10px;
	margin: 10px 0;
	border: 1px solid #ccc;
	border-radius: 5px;
	cursor: pointer;
	margin-left: 10px;
}

input[type="submit"]:hover {
	background-color: #4cae4c;
}

.form-container {
	max-width: 900px;
	margin: 20px auto;
	background: #fff;
	padding: 25px;
	border-radius: 10px;
	box-shadow: 0 2px 15px rgba(0, 0, 0, 0.1);
	font-family: 'Roboto', sans-serif;
}

.form-title {
	text-align: center;
	margin-bottom: 25px;
	color: #2c3e50;
	font-size: 24px;
	font-weight: 600;
}

.form-table {
	width: 100%;
	border-collapse: separate;
	border-spacing: 15px;
}

.form-table td {
	width: 50%;
	vertical-align: top;
}

.form-group {
	display: flex;
	flex-direction: column;
}

.form-group label {
	margin-bottom: 6px;
	font-weight: 500;
	color: #34495e;
}

.form-group input, .form-group select {
	padding: 10px 12px;
	border: 1px solid #dcdcdc;
	border-radius: 6px;
	font-size: 14px;
	width: 100%;
	box-sizing: border-box;
}

.form-group input:focus, .form-group select:focus {
	border-color: #3498db;
	outline: none;
}

.radio-group {
	display: flex;
	gap: 20px;
	align-items: center;
}

.radio-group label {
	margin: 0;
	font-weight: 500;
}

#Mnumber {
	display: inline-block;
	padding: 10px;
	background: #f8f9fa;
	border: 1px solid #ddd;
	border-radius: 6px;
	min-height: 20px;
}

.btn-submit {
	width: 200px;
	padding: 12px;
	background: #28a745;
	color: #fff;
	border: none;
	border-radius: 6px;
	font-size: 15px;
	cursor: pointer;
	font-weight: 600;
}

.btn-submit:hover {
	background: #218838;
}

.submit-row {
	text-align: center;
	padding-top: 15px;
}

small {
	color: #777;
	margin-top: 5px;
}
.password-container{
    display: flex;
    gap: 20px;
    margin-top: 15px;
}

.form-group{
    flex: 1;
    display: flex;
    flex-direction: column;
}

.form-group label{
    margin-bottom: 6px;
    font-weight: 500;
    color: #333;
}

.form-group input{
    padding: 10px 12px;
    border: 1px solid #dcdcdc;
    border-radius: 6px;
    font-size: 14px;
    width: 100%;
    box-sizing: border-box;
}

.form-group input:focus{
    outline: none;
    border-color: #0d6efd;
    box-shadow: 0 0 4px rgba(13,110,253,0.2);
}
#submitBtn {
    padding: 11px 20px;
    border: none;
    border-radius: 6px;
    background: #28a745;
    color: white;
    font-size: 14px;
    cursor: pointer;
    font-weight: 600;
}

#submitBtn:hover {
    background: #218838;
}

@media (max-width: 768px) {
    .password-container {
        flex-direction: column;
    }

    .btn-group {
        flex: 1;
    }

    #submitBtn {
        width: 100%;
    }
}
#password-container{
  display: flex;
  flex-direction: column;
}

</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.5/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.13.5/js/jquery.dataTables.min.js"></script>
<jsp:include page="url.jsp" />
<script>
    
    window.onload = function() {
        history.pushState(null, null, window.location.href);
        window.onpopstate = function() {
            history.pushState(null, null, window.location.href);
        };
    };
    let driverMobile= null;
    let driverData = null;
    function loginMeth(event){
	    	$('.spinner-container').show();
	        event.preventDefault(); // Prevent form submission
	
	        var email = document.getElementsByName('email')[0].value;
	        driverMobile=email;
	        var pass  = document.getElementsByName('LoginPass')[0].value;
	
	        $.ajax({
	            url: prod_url+'api/driver/login?mobile='+email+'&password='+pass,
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	            	console.log(response);
	            	$('.spinner-container').hide();
	                if(response.success){
	                	$('.spinner-container').hide();
	                	$('#login-container').hide();
	                	$('#reading-container').show();
	                	let driverName = response.data.driverName;
	                    let machineNumber = response.data.machineNumber;
	
	                    $('#driver-info').text(
	                        driverName + ' - ' +
	                        (machineNumber ? machineNumber : 'Machine not Assigned, Contact Administrator.')
	                    );
	                    if(!machineNumber){
	                    	$('.form-feilds').hide();
	                    }
	                    driverData=response;
	                }else if(response.message === "Please generate a password first."){
	                	$('#login-container').hide();
	                	$('#password-container').show();
	                }else{
	                	alert(response.message);
	                	window.location.reload();
	                }
						
	            },
	            error: function(xhr, status, error) {
	            	alert('Something went wrong ,please contact to Administrator.');
	            	$('.spinner-container').hide();
	                $('#result').html('Error: ' + error);
	            }
	        });
	  }
    function changePassword() {

        let pass = $('#password').val();
        let cnfPass = $('#confirmPassword').val();

        if(pass === '' || cnfPass === ''){
            alert('Please enter both passwords.');
            return;
        }

        if(pass !== cnfPass){
            alert('Passwords do not match.');
            return;
        }
        
        if(pass.length < 8){
            alert('Password must contain at least 8 characters.');
            return;
        }

        console.log(driverMobile + ' - ' + pass + ' - ' + cnfPass);

        $.ajax({
            url: prod_url + 'api/driver/changePassword',
            type: 'POST',
            data: {
                driverMobile: driverMobile,
                password: pass
            },
            success: function(response) {

                if(response.success){
                    alert(response.message);

                    $('#password-container').hide();
                    $('#reading-container').show();
                }else{
                    alert(response.message);
                }
            },
            error: function() {
                alert('Failed to update password');
            }
        });
    }
    
	$(document).ready(function() {
		$('.spinner-container').hide();
		$('#password-container').hide();
		$('#reading-container').hide();
		$('#endReading').prop('disabled', true).val(''); 
		  // Enable/Disable fields based on reading type selection
	    $('input[name="readingType"]').on('change', function () {
	        if ($(this).val() === 'startReading') {
	            $('#startReading').prop('disabled', false);
	            $('#endReading').prop('disabled', true).val('');  // Clear value when disabled
	        } else {
	            $('#startReading').prop('disabled', true).val('');
	            $('#endReading').prop('disabled', false);
	        }
	    });
		  
	    $('#vehicleReadingForm').on('submit', function (e) {
	        e.preventDefault(); // Prevent default form submission
	
	        const selectedReadingType = $('input[name="readingType"]:checked').val();
	       
			const formData = new FormData(this);
	
			   // Append additional data that is not directly part of the form
			   formData.append('selectedOwnerMobile', driverData.data.onwerMobile);
			   formData.append('machineNumber', driverData.data.machineNumber);
			   //const driverName = $('#driverList option:selected').text();
			    const driverId =  driverData.data.id; // Assuming 'driverList' is the ID of the dropdown
			      if (driverId) {
			          formData.append('driverId', driverId);  // Append driverId to FormData
			      }
	
			      // Append files only if selected
			      const startReadingFile = $('#startReading')[0].files[0];
			      if (startReadingFile) {
			          formData.append('startReading', startReadingFile);
			      }
	
			      const endReadingFile = $('#endReading')[0].files[0];
			      if (endReadingFile) {
			          formData.append('endReading', endReadingFile);
			      }
	
			      const disel = $('#disel')[0].files[0];
			      if (disel) {
			          formData.append('disel', disel);
			      }  
	
	        // Submit form data via AJAX
	        console.log(formData);
	        for (let pair of formData.entries()) {
	            console.log(pair[0] + ': ', pair[1]);
	        }
	        
	        const aiFormData = new FormData();
	        aiFormData.append('file', startReadingFile?startReadingFile:endReadingFile);
	        $('.spinner-container').show();
	        $.ajax({
	            url: prod_url+'/api/extract/reading',
	            type: 'POST',
	            data: aiFormData,
	            processData: false,
	            contentType: false,
	            headers: {
	                'accept': 'application/json'
	            },
	            success: function (response) {
	            	$('.spinner-container').hide();
	                console.log('Success:', response);
	                if(response.success){
	                	
	                
	                
	                formData.append('actulReading',response.reading);
	                $.ajax({
	    	            url: prod_url+'/driver/reading/submit',  // REST endpoint
	    	            type: 'POST',
	    				processData: false, // Prevent query string serialization
	    				contentType: false, // Let browser set Content-Type
	    	            data: formData,
	    	            success: function (response) {
	    	                alert(response);
	    	                $('#vehicleReadingForm')[0].reset();
	    	                $('#startReading').prop('disabled', false); // Reset to default state Mnumber
	    	                $('#endReading').prop('disabled', true);
	    					$('#Mnumber').hide();
	    	            },
	    	            error: function (xhr, status, error) {
	    	                console.error("Error submitting vehicle reading:", error);
	    	                alert('Error submitting vehicle reading. Please try again.');
	    	            }
	    	        });
	                }else{
	                	alert(response);
	                }
	            },
	            error: function (xhr, status, error) {
	                console.error('Error:', error);
	                alert('Failed to extract reading');
	            }
	        });
	        
	        
	       
	    });
	
	});
	
	 
    </script>
</head>
<body style="background-image: url('img/bk4.jpg'); background-position: center;">
	<div class="spinner-container">
		<div class="spinner"></div>
	</div>

	<div id="login-container" class="container">
		<h2>Driver Login</h2>

		<form onsubmit='loginMeth(event)'>
			<input type="text" name="email" placeholder="Mobile Number" required>
			<input type="password" name="LoginPass" placeholder="Password" required>
		    <input type="submit" value="Login"></input>
		</form>
		<div id="result"></div>
	</div>

	<div id="reading-container" style="display: none">
		<div class="form-container">

			<h2 class="form-title">Vehicle Reading Entry</h2>

			<form id="vehicleReadingForm" enctype="multipart/form-data">

				<table class="form-table">
				    <tr>
						<td colspan="2">
							<div class="form-group">
								<span id="driver-info">Loading</span>
							</div>
						</td>
					</tr>
				

					<tr class="form-feilds">
						<td colspan="2">
							<div class="form-group">
								<label>Reading Type</label>
								<div class="radio-group">
									<label> <input type="radio" name="readingType"
										value="startReading" checked> Start Reading
									</label> <label> <input type="radio" name="readingType"
										value="endReading"> End Reading
									</label>
								</div>
							</div>
						</td>
					</tr>

					<tr class="form-feilds">
						<td>
							<div class="form-group">
								<label for="startReading">Start Reading Image</label> <input
									type="file" id="startReading" name="startReading"
									accept="image/*"> <small>Accepts image files
									only</small>
							</div>
						</td>

						<td>
							<div class="form-group">
								<label for="endReading">End Reading Image</label> <input
									type="file" id="endReading" name="endReading" accept="image/*">
								<small>Accepts image files only</small>
							</div>
						</td>
					</tr>

					<tr class="form-feilds">
						<td>
							<div class="form-group">
								<label for="maintenanceNumber">Maintenance Amount</label> <input
									type="number" id="maintenanceNumber" name="maintenanceNumber"
									value="0">
							</div>
						</td>

						<td>
							<div class="form-group">
								<label for="disel">Diesel Bill Image</label> <input type="file"
									id="disel" name="disel" accept="image/*"> <small>Upload
									diesel bill image</small>
							</div>
						</td>
					</tr>

					<tr class="form-feilds">
						<td colspan="2" class="submit-row">
							<button type="submit" class="btn-submit">Submit Reading
							</button>
						</td>
					</tr>

				</table>

			</form>

		</div>

	</div>

<div id="password-container" class="password-container" style="display: none">

    <div>
        <input type="password"
               id="password"
               name="password"
               placeholder="Enter Password"
               required>
    </div>

    <div>
        <input type="password"
               id="confirmPassword"
               name="confirmPassword"
               placeholder="Confirm Password"
               required>
    </div>
    <div>
        <input type="submit"
               id="submitBtn"
               value="Submit" onclick="changePassword()">
    </div>
    

</div>
</body>

</body>
</html>