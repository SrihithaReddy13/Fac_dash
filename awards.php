<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Schedule</title>
  <script type="text/javascript" src="js/jquery-3.4.1.js"></script>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/basic.css">
  <script type="text/javascript" src="js/basic.js"></script>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">   
</head>
<body>
  <?php
    session_start();
    $fid=$_SESSION['fid'];
    $deptid=$_SESSION['deptid'];
    $acctype=$_SESSION['acctype'];
    if (isset($_SESSION['login'])){
      $login=$_SESSION['login'];
    }else{
      $login='NO';
    }
  ?>
  <div class="navbar_">
    <a style="font-size:30px; cursor:pointer; color: white; " onclick="openNav()">&#9776;</a>
    <h2 align="center" class="page-name">AWARDS</h2>
    <em class="material-icons" onclick="openSearch()">search</em>
  </div>

  <div id="mySidenav" class="sidenav">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="dashboard.php">Dashboard</a>
    
    <a href='events.php'>Events</a>
    <a href='awards.php'>Acheivements</a>
    <a href='papers.php'>Publications</a>
    <?php 
      if($login=='OK'){
        echo "<a href='profile.php'>Profile</a>";
        echo "<a href='loutprocess.php'>Logout</a>";
      }else{
        echo "<a href='main.php'>Login</a>";
      }
    ?>
  </div>
  <div id="main" class="main">
    <div>
      <img height="300px" width="1250px" class="card-img-top" src='images/award' alt="Card image cap">
    </div>
    <div class="table-result gap">
      <?php
              $con=mysqli_connect("localhost", "root", "pass");
              mysqli_select_db($con,"fac_dash");
              $sql3 = "SELECT * FROM acheivement where visibility='Show' order by adate desc";
              $result3 = $con->query($sql3);
              if($result3->num_rows==0){
                echo "<h4>None</h4>";
              }else{
                echo "<table class='table table-striped table-bordered tposition'>";
                echo "<thead>"; 
                echo "<tr>";
                echo "<th scope='col'><b>#</b></th>";
                echo "<th scope='col'><b>Name</b></th>";
                echo "<th scope='col'><b>Department</b></th>";
                echo "<th scope='col'><b>Award</b></th>";
                echo "<th scope='col'><b>Receieved on</b></th>";
                echo "</tr>";
                echo "</thead>";
                echo "<tbody>"; 
                $i=1;
                while($row = $result3->fetch_assoc()) {
                  $result1 = mysqli_query($con,"select * from fdbuser where fid=".$row['fid']."") or die("Failed to query database".mysqli_error($con));
                  $row1= mysqli_fetch_array($result1);
                  $result2 = mysqli_query($con,"select * from department where deptid=".$row1['deptid']."") or die("Failed to query database".mysqli_error($con));
                  $row2= mysqli_fetch_array($result2);
                  echo "<tr>";
                  echo "<td>".$i."</td>";
                  echo "<td>".$row1['fname']." ".$row1['lname']."</td>";
                  echo "<td>".$row2['deptname']."</td>";
                  echo "<td>".$row['aname']."</td>";
                  echo "<td>".$row['adate']."</td>";
                  echo "</tr>";
                  $i=$i+1;
                }
                echo "</tbody>";
                echo "</table>";
              }
      ?>
    </div>
  </div>

</body>
</html>
