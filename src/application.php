<!--studentName: AHMET SARIGÜNEY-->
<!--studentID: 21200846-->
<!--date: 30.11.2018-->
<!--lecture:  CS353-->
<!--homework: ASSIGNMENT_4-->
<!--filename: application.php-->

<html>
  <head>
    <style>
    body {
      background-color: #ffe800;
    }
    </style>
  </head>
  <body>
    <?php
      session_start();
      // Database information is declared
      $host = "dijkstra.ug.bcc.bilkent.edu.tr";
      $username = "ahmet.sariguney";
      $password = "dBAHUhbH";
      $database_name = "ahmet_sariguney";
      $connection = mysql_connect("$host", "$username", "$password") or die("Unable to connect!" . mysql_error());
      $database = mysql_select_db("$database_name") or die("Unable to select database!" . mysql_error());

      $Sid = $_SESSION['password'];
      $sname = $_SESSION['username'];

      $query1 = mysql_query("SELECT * FROM student WHERE Sid = '$Sid'") or die(mysql_error());
      $row1 = mysql_fetch_array($query1);

      $query2 = mysql_query("SELECT company.cid, company.cname, company.quota FROM student, company, apply WHERE student.Sid = '$Sid' AND student.Sid = apply.Sid AND company.cid = apply.cid")  or die(mysql_error());
      $query3 = mysql_query("SELECT * FROM company WHERE cid NOT IN (SELECT apply.cid FROM student, apply WHERE student.Sid = '$Sid' AND student.Sid = apply.Sid) ORDER BY cid ASC");

      if (!isset($_SESSION['username'])) {
          header("Location: login.php");
          exit();
      }
    ?>
    <!--Tables are provided-->
    <form method="POST" action="">
      <br><center><b><font size = "+2"> STUDENT INTERNSHIP APPLICATION SYSTEM </center><br><br>
      <center><b><font size = "+1"> Student Information </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><b>Student ID</b></td>
          <td><b>Student Name</b></td>
          <td><b>Birth Date</b></td>
          <td><b>Telephone Number</b></td>
          <td><b>City</b></td>
          <td><b>Year</b></td>
          <td><b>GPA</b></td>
        </tr>
        <tr>
          <td><?php echo $row1['Sid'] ?></td>
          <td><?php echo $row1['sname'] ?></td>
          <td><?php echo $row1['bdate'] ?></td>
          <td><?php echo $row1['telno'] ?></td>
          <td><?php echo $row1['scity'] ?></td>
          <td><?php echo $row1['year'] ?></td>
          <td><?php echo $row1['gpa'] ?></td>
        </tr>
      </table>

      <br><br><br>


      <center><b><font size = "+1"> Applied Internships </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><b>Company ID</b></td>
          <td><b>Company Name</b></td>
          <td><b>Available Quota</b></td>
  	    </tr>
      	<tr>
        	<?php
              while ($row2 = mysql_fetch_array($query2)) {
                  echo "<tr>";
                  echo "<td>";
                  echo $row2['cid'];
                  echo "</td>";
                  echo "<td>";
                  echo $row2['cname'];
                  echo "</td>";
                  echo "<td>";
                  echo $row2['quota'];
                  echo "</td>";
                  echo "</tr>";
              }
          ?>
      	</tr>
      </table>

      <br><br><br>


      <center><b><font size = "+1"> Available Internships </b></center><br>
      <table border='5' align="center">
        <tr>
          <td><b>Company ID</b></td>
          <td><b>Company Name</b></td>
          <td><b>Available Quota</b></td>
        </tr>
        <tr>
          <?php
            while ($row3 = mysql_fetch_array($query3)) {
                echo "<tr>";
                echo "<td>";
                echo $row3['cid'];
                echo "</td>";
                echo "<td>";
                echo $row3['cname'];
                echo "</td>";
                echo "<td>";
                echo $row3['quota'];
                echo "</td>";
                echo "</tr>";
            }
          ?>
        </tr>
      </table>

      <br><br><br>
      <center><b><font size = "+1"> Apply for New Internship </b><br>
      </b></font><br><strong><input type = "text" name = "companyID" size = "20"></strong>
      <input id = "button" type = "submit" name = "submit" value = "Submit"/></center><br><br><br><br><br><br>
    </form>
    <center><font size = "+1">
    <?php
      // An internship application process is done and then home page is opened
      $cid = $_POST['companyID'];
      $submit = $_POST['submit'];
      if (isset($submit)) {
          if (!empty($cid)) {
              $query4 = mysql_query("INSERT INTO apply (Sid, cid) VALUES ('$Sid', '$cid')") or die(mysql_error());
              $connection = exec($query4);
              echo "Successfully applied for new internship!<br>Going to the home page...";
              header("Refresh:1; url = home.php", true, 303);
              exit();
          } else {
              echo "Application failed!<br> You must enter a company id to apply for new internship.";
          }
      }
    ?>
    <br><a href = "logout.php">Logout</a><br>
    <a href = "home.php">Go back to previous page</a><br>
    </font></center>
  </body>
</html>
