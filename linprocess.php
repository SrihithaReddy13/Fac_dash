<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title></title>
</head>
<body>
	<?php
		session_start();
		$fid = $_POST['user'];
		$pwd= $_POST['pass'];
		$fid= stripcslashes($fid);
		$pwd = stripcslashes($pwd);
		$con=mysqli_connect("localhost", "root", "pass");
		mysqli_select_db($con,"fac_dash");

		$result = mysqli_query($con,"select * from login where fid='$fid'") or die("Failed to query database".mysqli_error($con));
		$row= mysqli_fetch_array($result);
		function alert($msg,$goto){
			echo '<script type="text/javascript">';                                         		
			echo 'alert('.$msg.');'; 
			echo 'window.location.href ='.$goto.';';
			echo '</script>';
		}
		if ($row['fid'] == $fid) {
			$result = mysqli_query($con,"select * from fdbuser where fid='$fid'") or die("Failed to query database".mysqli_error($con));
			$row= mysqli_fetch_array($result);
			$locked=$row['locked'];
			$count=$row['count'];
			if ($locked=='N'){
				$result = mysqli_query($con,"select * from login where fid='$fid'") or die("Failed to query database".mysqli_error($con));
				$row= mysqli_fetch_array($result);
				if ($pwd==$row['pwd']){
					$_SESSION['fid']=$fid;
					$_SESSION['acctype']=$row['acctype'];
					$_SESSION['deptid']=$row['deptid'];
					$_SESSION["login"] = "OK";
					$_SESSION['first']='N';
					$count=0;
					$sql = "UPDATE fdbuser SET count='".$count."' WHERE fid=".$fid."";
					$con->query($sql);
					header("Location:dashboard.php");
				}else{
					$count=$count+1;
					$sql = "UPDATE fdbuser SET count='".$count."' WHERE fid=".$fid."";
					$con->query($sql);
					if ($count==3){
						event("3 Failed attempts. 2 More failed attempts will lock your account.","main.php");
						
					}
					else if ($count==5){
						$sql = "UPDATE fdbuser SET locked='Y' WHERE fid=".$fid."";
						$con->query($sql);
						event("5 Failed attempts. Account Locked. To get a temporary password, please answer the Security Questions and verify yourself.","lockedout.php");
						
					}else{	
						event("Wrong Password. Attempts left='.(5-$count).'","main.php");
					}
				}
			}else{
				event("Account locked. To get a temporary password, please answer the Security Questions and verify yourself.","lockedout.php");
			}
		}else{
			event("No such user", "main.php");
		}
	?>
</body>
</html>