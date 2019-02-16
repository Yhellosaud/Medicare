<html>
  <head>
    <style>
    body {
      background-color: #5e9e70;
    }
    </style>
    </head>
    <body style ="background-image: url('backgroundImage.jpg');">
    <br><center><b><font size = "+5"> MEDICARE </center>
    <center><b><font size = "+1"> PATIENT MEDICAL TREATMENT TRACKING SYSTEM </center><br><br><br><br><br><br><br>
    <center><font size = "+1">
    <?php
      session_start();
      session_destroy();
      echo "Logout successful!<br>";
      header("Refresh:1; url = hall.php", true, 303);
      exit();
    ?>
    </font></center>
  </body>
<html>
