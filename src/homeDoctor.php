<html>
  <head>
    <style>
    body {
      background-color: #ee5757;
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

      $query1 = mysqli_query($connection, "SELECT * FROM person WHERE person_ID = '$id'") or die(mysql_error());
      $row1 = mysqli_fetch_array($query1);
      $query2 = mysqli_query($connection, "SELECT * FROM doctor WHERE doctor_ID = '$id'") or die(mysql_error());
      $row2 = mysqli_fetch_array($query2);
      //$query3 = mysqli_query($connection, "SELECT * FROM appointment WHERE doctor_ID = '$id'") or die(mysql_error());
      $query0 = mysqli_query($connection, "DROP VIEW doc_app");
      $query4 = mysqli_query($connection, "DROP VIEW pat_app");
      $query3 = mysqli_query($connection, "CREATE VIEW doc_app AS SELECT appointment_ID FROM has_app_doc WHERE doctor_ID = '$id'") or die(mysqli_error($connection));
      $query3 = mysqli_query($connection, "SELECT * FROM appointment, doc_app WHERE doc_app.appointment_ID = appointment.appointment_ID AND appointment.cancelled = 0") or die(mysqli_error($connection));
      //$query6 = mysqli_query($connection, "SELECT * FROM person INNER JOIN has_app_patient ON has_app_patient.patient_ID = person.person_ID") or die(mysqli_error($connection));
      /*if(!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
      }*/
    ?>
    <!--Tables are provided-->
    <form method="POST" action=""><font color="white">
      <br><center><b><font size = "+5"> DOCTOR SYSTEM </center>
      <center><b><font size = "+1"> HOME PAGE </center><br><br>
      <center><b><font size = "+1"> Personal Information </b></center><br>
      <table border='5' align="center">
      	<tr>
      		<td><font color="white"><b>First Name</b></font></td>
      		<td><font color="white"><b>Middle Name</b></font></td>
          <td><font color="white"><b>Last Name</b></font></td>
      		<td><font color="white"><b>Phone Number</b></font></td>
      		<td><font color="white"><b>E-mail address</b></font></td>
      		<td><font color="white"><b>Office</b></font></td>
      		<td><font color="white"><b>Specialization</b></font></td>
      		<td><font color="white"><b>Title</b></font></td>
          <td><font color="white"><b>Address</b></font></td>
      	</tr>
      	<tr>
      		<td><font color="white"><?php echo $row1['first_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['middle_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['last_name'] ?></font></td>
      		<td><font color="white"><?php echo $row1['phone-num'] ?></font></td>
      		<td><font color="white"><?php echo $row1['e-mail'] ?></font></td>
      		<td><font color="white"><?php echo $row2['office'] ?></font></td>
      		<td><font color="white"><?php echo $row2['specialization'] ?></font></td>
      		<td><font color="white"><?php echo $row2['title'] ?></font></td>
      		<td><font color="white"><?php echo $row2['address'] ?></font></td>
      	</tr>
      </table>



      <br><br><br>



      <center><b><font size = "+1"> Appointments </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><font color="white"><b>First Name</b></font></td>
      		<td><font color="white"><b>Middle Name</b></font></td>
          <td><font color="white"><b>Last Name</b></font></td>
          <td><font color="white"><b>Appointment Date</b></font></td>
          <td><font color="white"><b>Status</b></font></td>
          <td><font color="white"><b>Cancellation</b></font></td>
          <td><font color="white"><b>View Appointment</b></font></td>
  	    </tr>
      	<tr>
        	<?php
          	while($row3 = mysqli_fetch_array($query3)) {
              //$row6 = mysqli_fetch_array($query6);
              $query4 = mysqli_query($connection, "DROP VIEW per_app");
              $appointmentID = $row3['appointment_ID'];
              $query5 = mysqli_query($connection, "CREATE VIEW per_app AS SELECT patient_ID FROM has_app_patient WHERE appointment_ID = '$appointmentID'") or die(mysqli_error($connection));
              $query5 = mysqli_query($connection, "SELECT * FROM person, per_app WHERE per_app.patient_ID = person.person_ID") or die(mysqli_error($connection));
              $row5 = mysqli_fetch_array($query5);
          		echo "<tr>";
              echo "<td><font color='white'>";
              echo $row5['first_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row5['middle_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row5['last_name'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['app_date'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              if($row3['approved'] == 1) {
                if($row3['completed'] == 1) {
                  echo "Completed";
                }
                else {
                  echo "Ongoing";
                }
              }
              echo "</font></td>";
          		echo "<td><font color='white'>";
              echo "<form method='POST' action=''>";
          		echo "<input type = 'hidden' name = 'cancellation' value = '".$row3['cancelled']."' />";
          		echo "<input type = 'submit' name = 'cancel' value = 'Cancel' /> </form>";
          		echo "</font></td>";
              echo "<td><font color='white'>";
              echo "<form method='POST' action=''>";
              echo "<input type = 'hidden' name = 'view' value = 'view' />";
              echo "<input type = 'submit' name = 'view' value = 'View' /> </form>";
              echo "</font></td>";
          		echo "</tr>";
              // Cancellation is performed according to company id
              $appID = $row3['appointment_ID'];
              if(isset($_POST['cancel'])) {
                $query3 = mysqli_query($connection, "UPDATE appointment SET cancelled = 1 WHERE appointment_ID = '$appID'") or die(mysqli_error($connection));
                $connection = exec($query3);
                header("Location:  homeDoctor.php");
                exit();
              }
              else if(isset($_POST['view'])) {
                $_SESSION['appointmentID'] = $appID;
                $_SESSION['personID'] = $row5['person_ID'];
                header("Location:  appointment.php");
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
          <td><font color="white"><b>Middle Name </b></font></td>
          <td><font color="white"><b>Last Name </b></font></td>
          <td><font color="white"><b>Appointment Date</b></font></td>
          <td><font color="white"><b>Approve</b></font></td>
          <td><font color="white"><b>Reject</b></font></td>
  	    </tr>
      	<tr>
        	<?php
          	while($row2 = mysqli_fetch_array($query2)) {
          		echo "<tr>";
          		echo "<td><font color='white'>";
          		echo $row2['appointment_ID'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['app_date'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
          		echo $row2['approved'];
          		echo "</font></td>";
          		echo "<td><font color='white'>";
              echo "<form method='POST' action=''>";
          		echo "<input type = 'hidden' name = 'cancellation' value = '".$row2['cid']."' />";
          		echo "<input type = 'submit' name = 'cancel' value = 'Cancel' /> </form>";
          		echo "</font></td>";
          		echo "</tr>";
              // Cancellation is performed according to company id
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
      </table><br><br><br><br><br><br>
    </form>
    <center><font size = "+1">
    <?php
      // An internship application page is opened if the limitation is not exceeded

      if(isset($_POST['submit'])) {
        if($number_of_companies < 3) {
          echo "Successfully requested for new internship!<br>Going to the application page...";
          $_SESSION['password'] = $Sid;
          header("Refresh:1; url = application.php", true, 303);
          exit();
        }
        else {
          echo "Request failed!<br> You have already 3 internship applications.";
        }
      }
    ?>
    <br><a href = "logout.php">Logout</a><br>
    <a href = "login.php">Go back to previous page</a>
    </font></center>
  </body>
</html>
