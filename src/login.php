<html>
  <head>
    <style>
    body {
      background-color: #5f96c9;
    }
    </style>
  </head>
  <body style ="background-image: url('backgroundImage.jpg');">
    <!--form action creation for text bar and submit button-->
    <form method="POST" action=""><font color="white">
      <br><center><b><font size = "+5"> MEDICARE </center>
      <center><b><font size = "+1"> PATIENT MEDICAL TREATMENT TRACKING SYSTEM </center>
  		<center><u><?php
      session_start();
      $account = $_SESSION['account'];
      echo $account ?></u></center><br><br><br><br>
      <center><b><font size = "+1"> Username </b></font><br><strong><input type = "text" name = "id" size = "20"></strong></center><br>
      <center><b><font size = "+1"> Password </b></font><br><input type = "password" name = "password" size = "20"></center><br><br>
      <center><input id = "button" type = "submit" name = "submit" value = "Log in"/></center><br><br><br><br><br><br>
      <br><br><br><br>
    </form>
    <center><font size = "+1">
    <?php
      // Database information is declared
      $host = "localhost";
      $username = "user";
      $password = "password";
      $database_name = "medicare";

      $connection = mysqli_connect("$host", "root") or die ("Unable to connect!" . mysql_error());
      //$connection = mysqli_connect("$host", "$username", "$password") or die ("Unable to connect!" . mysql_error());
      $database = mysqli_select_db($connection, "$database_name") or die ("Unable to select database!" . mysql_error());
      // Form information was fetched
      // If this page is reached some way, close old session

      // The information submitted is checked and corresponding behaviours are applied
      if(isset($_POST['submit'])) {
        $id = $_POST['id'];
        $password = $_POST['password'] ?? '';
      	if(!empty($id) && !empty($password)) {
          if($account == "Doctor") {
            $query1 = "SELECT person.password, doctor.doctor_ID FROM person, doctor WHERE BINARY doctor.doctor_ID = '$id' AND BINARY person.password = '$password'";
          }
          else if($account == "Patient") {
            $query1 = "SELECT person.password, patient.patient_ID FROM person, patient WHERE BINARY patient.patient_ID = '$id' AND BINARY person.password = '$password'";
          }
          else if($account == "Hospital") {
            $query1 = "SELECT * FROM hospital WHERE BINARY hospital_ID = '$id' AND BINARY password = '$password'";
          }
          else if($account == "Pharmacy") {
            $query1 = "SELECT * FROM pharmacy WHERE BINARY pharmacy_ID = '$id' AND BINARY password = '$password'";
          }
          $result = mysqli_query($connection, $query1);
      		$row1 = mysqli_fetch_array($result);
          $count = mysqli_num_rows($result);
      		if($count <= 0) {
            echo "Login failed!<br>Invalid username or password.<br>Please try again!";
          }
          else {
            echo "Login successful!<br>Entering your page...";
            $_SESSION['id'] = $id;
            $_SESSION['password'] = $password;
            if($account == "Doctor") {
              header("Refresh:1; url = homeDoctor.php", true, 303);
            }
            else if($account == "Patient") {
              header("Refresh:1; url = homePatient.php", true, 303);
            }
            else if($account == "Hospital") {
              header("Refresh:1; url = homeHospital.php", true, 303);
            }
            else if($account == "Pharmacy") {
              header("Refresh:1; url = homePharmacy.php", true, 303);
            }
            exit();
      		}
      	}
      	else {
      		//"Refresh:1; url =, true, 303
      		echo "Login failed!<br>You must enter both your username and password!";
      	}
        //header("Refresh:1; url = login.php", true, 303);
      }
      error_reporting(E_ALL ^ E_NOTICE);
    ?>
    </font></center>
  </body>
</html>
