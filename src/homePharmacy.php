<html>
  <head>
    <style>
    body {
      background-color: #f9d469;
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

      //$query1 = mysqli_query($connection, "SELECT * FROM has_doc_hospital WHERE hospital_ID = '$id' IN (SELECT * FROM person WHERE person_ID = doctor_ID)") or die(mysqli_error($connection));
      //$query1 = mysqli_query($connection, "SELECT * FROM person WHERE person_ID IN (SELECT doctor_ID FROM has_doc_hospital WHERE hospital_ID = '$id')") or die(mysqli_error($connection));
      $query0 = mysqli_query($connection, "DROP VIEW doc_hos");
      $query1 = mysqli_query($connection, "CREATE VIEW doc_hos AS SELECT doctor_ID FROM has_doc_hospital WHERE hospital_ID = '$id'") or die(mysqli_error($connection));
      $query1 = mysqli_query($connection, "SELECT * FROM person, doc_hos WHERE doc_hos.doctor_ID = person.person_ID") or die(mysqli_error($connection));
      $query3 = mysqli_query($connection,"SELECT * FROM hospital WHERE hospital_ID = '$id'") or die(mysql_error());
      $row3 = mysqli_fetch_array($query3);
      /*if(!isset($_SESSION['username'])) {
        header("Location: login.php");
        exit();
      }*/
    ?>
    <!--Tables are provided-->
    <form method="POST" action=""><font color="white">

      <br><center><b><font size = "+5"> PHARMACY SYSTEM </center>
        <center><b><font size = "+1"> HOME PAGE </center><br><br>
        <center><b><font size = "+1"> Pharmacist Information </b></center><br>
        <table border='5' align="center">
          <tr>
            <td><font color="white"><b>Pharmacist Name</b></font></td>
            <td><font color="white"><b>Rating</b></font></td>
            <td><font color="white"><b>Address</b></font></td>
            <td><font color="white"><b>Phone Number</b></font></td>
    	    </tr>
        	<tr>
            <td><font color="white"><?php echo $row3['name'] ?></font></td>
        		<td><font color="white"><?php echo $row3['rating'] ?></font></td>
        		<td><font color="white"><?php echo $row3['address'] ?></font></td>
        		<td><font color="white"><?php echo $row3['phone-num'] ?></font></td>
        	</tr>
        </table>
        <br><br><br>
        <center><input id = "button" type = "submit" name = "submit" value = " "/></center><br><br><br><br><br><br>
      </form>
      <center>
      <center><b><font size = "+1"> Doctor Informations </b></center><br>
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
            <?php
            	while($row1 = mysqli_fetch_array($query1)) {
                $doctorID = $row1['person_ID'];
                $query2 = mysqli_query($connection, "SELECT * FROM doctor WHERE doctor_ID = '$doctorID'") or die(mysql_error());
                $row2 = mysqli_fetch_array($query2);
            		echo "<tr>";
            		echo "<td><font color='white'>";
            		echo $row1['first_name'];
            		echo "</font></td>";
            		echo "<td><font color='white'>";
            		echo $row1['middle_name'];
            		echo "</font></td>";
            		echo "<td><font color='white'>";
            		echo $row1['last_name'];
            		echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row1['phone-num'];
                echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row1['e-mail'];
                echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row2['office'];
                echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row2['specialization'];
                echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row2['title'];
                echo "</font></td>";
                echo "<td><font color='white'>";
                echo $row2['address'];
                echo "</font></td>";
            		echo "</tr>";
                // Cancellation is performed according to company id
            	}
            ?>
        	</tr>
        </table>



      <br><br><br>

      <font size = "+1">
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
