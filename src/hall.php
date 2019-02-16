<html>
  <head>
    <style>
    body {
      background-color: #ff6666;
    }
    </style>
  </head>
  <body style ="background-image: url('backgroundImage.jpg');">
    <!--form action creation for text bar and submit button-->
    <form method="POST" action=""><font color="white">
      <br><center><b><font size = "+5"> MEDICARE </center>
      <center><b><font size = "+1"> PATIENT MEDICAL TREATMENT TRACKING SYSTEM </center><br><br><br><br><br><br><br>
        <center><b><font size = "+1"> Welcome! </center>
      <center><b><font size = "+1"> Select profession to login </center><br>
      <center><input id = "button" type = "submit" name = "Doctor" value = "Patient"/>
      <input id = "button" type = "submit" name = "Patient" value = "Doctor"/>
      <input id = "button" type = "submit" name = "Hospital" value = "Hospital"/>
      <input id = "button" type = "submit" name = "Pharmacy" value = "Pharmacy"/></center>
      <br><br><br><br>
    </form>
    <center><font size = "+1">
    <?php
      session_start();
      // Database information is declared
      $host = "localhost";
      $username = "user";
      $password = "password";
      $database_name = "medicare";

      $connection = mysqli_connect("$host", "root") or die ("Unable to connect!" . mysql_error());
      //$connection = mysqli_connect("$host", "$username", "$password") or die ("Unable to connect!" . mysql_error());
      $database = mysqli_select_db($connection, "$database_name") or die ("Unable to select database!" . mysqli_error($connection));

      // The information submitted is checked and corresponding behaviours are applied
      if(isset($_POST['Doctor'])) {
        $_SESSION['account'] = $_POST['Doctor'];
        header("Refresh:0; url = login.php", true, 303);
        exit();
      }
      else if(isset($_POST['Patient'])) {
        $_SESSION['account'] = $_POST['Patient'];
        header("Refresh:0; url = login.php", true, 303);
        exit();
      }
      else if(isset($_POST['Hospital'])) {
        $_SESSION['account'] = $_POST['Hospital'];
        header("Refresh:0; url = login.php", true, 303);
        exit();
      }
      else if(isset($_POST['Pharmacy'])) {
        $_SESSION['account'] = $_POST['Pharmacy'];
        header("Refresh:0; url = login.php", true, 303);
        exit();
      }
      else {
      }
    ?>
    </font></center>
  </body>
</html>
