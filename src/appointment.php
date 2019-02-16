<html>
  <head>
    <style>
    body {
      background-color: #ffffdc;
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

      $personID = $_SESSION['personID'];
      $appointmentID = $_SESSION['appointmentID'];
      $query1 = mysqli_query($connection, "SELECT * FROM person WHERE person_ID = '$personID'") or die(mysql_error());
      $row1 = mysqli_fetch_array($query1);
      $query2 = mysqli_query($connection, "SELECT * FROM disease WHERE disease_ID = (SELECT disease_ID FROM app_disease WHERE appointment_ID = '$appointmentID')") or die(mysqli_error($connection));
      $row2 = mysqli_fetch_array($query2);
      $query0 = mysqli_query($connection, "DROP VIEW test_app");
      $query3 = mysqli_query($connection, "CREATE VIEW test_app AS SELECT test_ID FROM app_test WHERE appointment_ID = '$appointmentID'") or die(mysqli_error($connection));
      $query3 = mysqli_query($connection, "SELECT * FROM test, test_app WHERE test_app.test_ID = test.test_ID") or die(mysqli_error($connection));
      $query4 = mysqli_query($connection, "SELECT * FROM treatment WHERE treatment_ID = (SELECT treatment_ID FROM app_treat WHERE appointment_ID = '$appointmentID')") or die(mysqli_error($connection));
      $row4 = mysqli_fetch_array($query4);
      $query5 = mysqli_query($connection, "SELECT * FROM prescription WHERE prescription_ID = (SELECT prescription_ID FROM app_pres WHERE appointment_ID = '$appointmentID')") or die(mysqli_error($connection));
      $row5 = mysqli_fetch_array($query5);
    ?>
    <!--Tables are provided-->
    <form method="POST" action=""><font color="white">
      <br><center><b><font size = "+5"> DOCTOR SYSTEM </center>
      <center><b><font size = "+1"> APPOINTMENT INFORMATION </center><br><br>
      <center><b><font size = "+1"> Patient </b></center><br>
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


      <center><b><font size = "+1"> Disease </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><font color="white"><b>Disease Name</b></font></td>

        </tr>
        <tr>
          <td><font color="white"><?php echo $row2['name'] ?></font></td>

        </tr>
      </table>
      <br><br><br>

      <center><b><font size = "+1"> Tests </b></center><br>
      <table border='5' align="center">
      	<tr>
          <td><font color="white"><b>Test ID</b></font></td>
          <td><font color="white"><b>Test Date</b></font></td>
      		<td><font color="white"><b>Result</b></font></td>
      	</tr>
      	<tr>
          <?php
            while($row3 = mysqli_fetch_array($query3)) {
              echo "<tr>";
              echo "<td><font color='white'>";
              echo $row3['test_ID'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['test_date'];
              echo "</font></td>";
              echo "<td><font color='white'>";
              echo $row3['result'];
              echo "</font></td>";
            }
          ?>
      	</tr>
      </table>
    <br><br><br>

    <center><b><font size = "+1"> Treatment </b></center><br>
    <table border='5' align="center">
      <tr>
        <td><font color="white"><b>Treatment ID</b></font></td>
        <td><font color="white"><b>Treatment Name</b></font></td>
      </tr>
      <tr>
        <td><font color="white"><?php echo $row4['treatment_ID'] ?></font></td>
        <td><font color="white"><?php echo $row4['name'] ?></font></td>
      </tr>
    </table>
  <br><br><br>



  <center><b><font size = "+1"> Prescription </b></center><br>
  <table border='5' align="center">
    <tr>
      <td><font color="white"><b>Prescription ID</b></font></td>
      <td><font color="white"><b>Drugs</b></font></td>

    </tr>
    <tr>
      <td><font color="white"><?php echo $row5['prescription_ID'] ?></font></td>
      <td><font color="white"><?php echo $row5['text'] ?></font></td>
    </tr>
  </table>
<br><br><br>


    <br><br><br><br><br><br>
    <center>
    <br><a href = "logout.php">Logout</a><br>
    <a href = "homeDoctor.php">Go back to previous page</a>
    </font></center>
  </body>
</html>
