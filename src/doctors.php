<html>
  <head>
    <style>
    body {
      background-color: #b5c758;
    }
    </style>
  </head>
  <body style ="background-image: url('backgroundImage.jpg');">
    <?php
      session_start();
      // Database information is declared
      $host = "localhost";
      $username = "user";
      $password = "password";
      $database_name = "medicare";
      $connection = mysqli_connect("$host", "root") or die ("Unable to connect!" . mysql_error());
      //$connection = mysqli_connect("$host", "$username", "$password") or die ("Unable to connect!" . mysql_error());
      $database = mysqli_select_db($connection, "$database_name") or die ("Unable to select database!" . mysql_error());

      $id = $_SESSION['id'];
      $password = $_SESSION['password'];
      $hospitalID = $_SESSION['hospitalID'];
      $hospitalName = $_SESSION['hospitalName'];

      $query1 = mysqli_query($connection, "SELECT * FROM person WHERE person_ID = '$id'") or die(mysql_error());
      $row1 = mysqli_fetch_array($query1);
      $query2 = mysqli_query($connection, "SELECT * FROM patient WHERE patient_ID = '$id'") or die(mysql_error());
      $row2 = mysqli_fetch_array($query2);
      $query0 = mysqli_query($connection, "DROP VIEW doc_hos");
      $query3 = mysqli_query($connection, "CREATE VIEW doc_hos AS SELECT doctor_ID FROM has_doc_hospital WHERE hospital_ID = '$hospitalID'") or die(mysqli_error($connection));
      $query3 = mysqli_query($connection, "SELECT * FROM person, doc_hos WHERE doc_hos.doctor_ID = person.person_ID") or die(mysqli_error($connection));
      /*if(!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
      }*/
    ?>
    <!--Tables are provided-->
    <form method="POST" action=""><font color="white">
      <br><center><b><font size = "+5"> PATIENT SYSTEM </center>
      <center><b><font size = "+1"> HOME PAGE </center><br><br>
      <center><b><font size = "+1"> Personal Information </b></center><br>
      <table border='5' align="center">
      	<tr>
          <td><font color="white"><b>First Name</b></font></td>
      		<td><font color="white"><b>Middle Name</b></font></td>
          <td><font color="white"><b>Last Name</b></font></td>
      		<td><font color="white"><b>Phone Number</b></font></td>
      		<td><font color="white"><b>E-mail address</b></font></td>
      	</tr>
      	<tr>
          <td><font color="white"><?php echo $row1['first_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['middle_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['last_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['phone-num'] ?></font></td>
      		<td><font color="white"><?php echo $row1['e-mail'] ?></font></td>
      	</tr>
      </table>



      <br><br><br>



      <center><b><font size = "+1"> Appointments </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><font color="white"><b>Company ID</b></font></td>
          <td><font color="white"><b>Company Name</b></font></td>
          <td><font color="white"><b>Available Quota</b></font></td>
          <td><font color="white"><b>Cancellation</b></font></td>
  	    </tr>
      	<tr>
        	<?php
          	while($row2 = mysqli_fetch_array($query2)) {
          		echo "<tr>";
          		echo "<td><font color='white'>";
          		echo $row2['cid'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['cname'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['quota'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
              echo "<form method='POST' action=''>";
          		echo "<input type = 'hidden' name = 'cancellation' value = '".$row2['cid']."' />";
          		echo "<input type = 'submit' name = 'cancel' value = 'Cancel' /> </form>";
          		echo "</font></td>";
          		echo "</tr>";
              // Cancellation is performed according to company id
              $number_of_companies++;
              $cancellationID = $row2['cid'];
              $cancel = $_POST['cancel'];
              if(isset($cancel)) {
                $query3 = mysql_query("DELETE FROM apply WHERE cid = '$cancellationID'") or die(mysql_error());
                $connection = exec($query3);
                header("Location:  home.php");
                exit();
              }
          	}
          ?>
      	</tr>
      </table>


      <br><br><br>


      <center><b><font size = "+1"> Appointment Requests </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><font color="white"><b>First Name</b></font></td>
          <td><font color="white"><b>Middle Name</b></font></td>
          <td><font color="white"><b>Last Name</b></font></td>
          <td><font color="white"><b>Office</b></font></td>
          <td><font color="white"><b>Date</b></font></td>
  	    </tr>
      	<tr>
        	<?php
          	while($row2 = mysqli_fetch_array($query2)) {
          		echo "<tr>";
          		echo "<td><font color='white'>";
          		echo $row2['cid'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['cname'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['quota'];
          		echo "</font></td>";
          		echo "</tr>";
              // Cancellation is performed according to company id
              $number_of_companies++;
              $cancellationID = $row2['cid'];
              $cancel = $_POST['cancel'];
              if(isset($cancel)) {
                $query3 = mysql_query("DELETE FROM apply WHERE cid = '$cancellationID'") or die(mysql_error());
                $connection = exec($query3);
                header("Location:  home.php");
                exit();
              }
          	}
          ?>
      	</tr>
      </table>



      <br><br><br>



      <center><b><font size = "+1"> <font color="white"> Doctors - <?php echo $hospitalName ?></font></b></center><br>
      <table border='5' align="center">
        <tr>
          <td><font color="white"><b>Hospital Name</b></font></td>
          <td><font color="white"><b>Rating</b></font></td>
          <td><font color="white"><b>Address</b></font></td>
          <td><font color="white"><b>Telephone Number</b></font></td>
          <td><font color="white"><b>Email Address</b></font></td>
          <td><font color="white"><b>Appointment</b></font></td>
        </tr>
        <tr>
          <?php
            while($row3 = mysqli_fetch_array($query3)) {
              echo "<tr>";
              echo "<td><font color='white'>";
              echo $row3['first_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['middle_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['last_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['phone-num'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['e-mail'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo "<form method='POST' action=''>";
          		echo "<input type = 'hidden' name = 'apply' value = 'apply' />";
          		echo "<input type = 'submit' name = 'apply' value = 'Apply' /> </form>";
          		echo "</font></td>";
              echo "</tr>";
              // Cancellation is performed according to company id
              if(isset($_POST['apply'])) {
                $doctorID = $row3['person_ID'];
                $query4 = mysqli_query($connection, "INSERT INTO appointment(appointment_ID, app_date, approved, completed, cancelled) VALUES (NULL, '2019-01-02', '0', '0', '0')") or die(mysqli_error($connection));
                $query10 = mysqli_query($connection, "SELECT * FROM appointment ORDER BY appointment_ID DESC LIMIT 1");
                $row10 = mysqli_fetch_array($query10);
                $appID = $row10['appointment_ID'];
                $query5 = mysqli_query($connection, "INSERT INTO has_app_doc(doctor_ID, appointment_ID) VALUES ('$doctorID', '$appID')") or die(mysqli_error($connection));
                $query6 = mysqli_query($connection, "INSERT INTO has_app_patient(patient_ID, appointment_ID) VALUES ('$id', '$appID')") or die(mysqli_error($connection));
                $connection = exec($query4);
                $connection = exec($query5);
                $connection = exec($query6);
                header("Location:  homePatient.php");
                exit();
              }
            }
          ?>
        </tr>
      </table>
    </form>
    <center><font size = "+1">
    <?php
      if(isset($_POST['submit'])) {
        if($number_of_companies < 3) {
          echo "Successfully requested for a new appointment!<br>";
          $_SESSION['password'] = $Sid;
          header("Refresh:1; url = application.php", true, 303);
          exit();
        }
        else {
          echo "Request failed!<br> The entered doctor is not available";
        }
      }
    ?>
    <br><a href = "logout.php">Logout</a><br>
    <a href = "login.php">Go back to previous page</a>
    </font></center>
  </body>
</html>
