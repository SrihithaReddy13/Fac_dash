<?
	ini_set('mysql_connect_timeout',300);
	ini_set('default_socket_timeout',300);
?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Dashboard</title>
	<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="css/basic.css">
	<link rel="stylesheet" href="css/dashboard.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<script type="text/javascript" src="js/basic.js"></script>    
	<script type="text/javascript" src="js/dashboard.js"></script>    
</head>
<body>
	<?php
		session_start();
		$login=$_SESSION['login'];
	?>
	<div class="navbar_">
		<a style="font-size:30px; cursor:pointer; color: white; " onclick="openNav()">&#9776;</a>
		<h2 align="center" class="page-name">DASHBOARD</h2>
		<em class="material-icons" onclick="openSearch()">search</em>
	</div>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href='dashboard.php'>Dashboard</a>
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

	<div id="main" class="main mcard">
		<div class="banner">
			<div class="greetings">	
				<h1 align="center">WELCOME!</h1>
			</div>
			<div class="about aboutcard">
				<p>. </p>
				<h1 align="center"> AMRITA VISHWA VIDYAPEETHAM </h1>
				<?php
				echo "<img id='img' src='images/amrita' width='100%'/>";
				?>
				<h4 align="center"><em>Campus: Coimbatore</em></h4>
				<p>.</p>
			</div>
		</div>
		<div class="recent">
			<div class="acheivements acard gap">
				<h2 align="center"><strong>Acheivements</strong></h2>
				<div class="row">
					  <div class="col-sm-3">
					    <div class="card text-center border-dark mb-3 gap-l" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/sportsmeet' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">Faculty Sports Meet</h3>
						    <p class="card-text"><h4>Congratulations to all the faculty who won the games!</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
					  <div class="col-sm-3">
					     <div class="card text-center border-dark mb-3 gap-l1" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/ieee' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">IEEE</h3>
						    <p class="card-text"><h4>Congratulations to all the faculty who attended IEEE 2019!</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
					  <div class="col-sm-3">
					     <div class="card text-center border-dark mb-3 gap-l2" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/sportsmeet' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">Faculty Sports Meet</h3>
						    <p class="card-text"><h4>Congratulations to all the faculty who won the games!</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
				</div>
				<div  onclick="achFunc()" class="back position1">
				    <div class="button_base b03_skewed_slide_in">
				        <div>Achievements>></div>
				        <div></div>
				        <div>Acheivements>></div>
				    </div>
				</div>
			</div>
			<div class="acheivements acard gap">
				<h2 align="center"><strong>Events/Workshop</strong></h2>
				<div class="row">
					  <div class="col-sm-3">
					    <div class="card text-center border-dark mb-3 gap-l" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/anokha' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">Anokha 2020</h3>
						    <p class="card-text"><h4>The 10th tech-fest of Amrita, Coimbatore, Now Open!</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
					  <div class="col-sm-3">
					     <div class="card text-center border-dark mb-3 gap-l1" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/workshop' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">Workshop on Workshop on Stochastic Modelling</h3>
						    <p class="card-text"><h4>Upcoming: Workshop on Stochastic Modelling: Applications in Civil Engineering on April 13</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
					  <div class="col-sm-3">
					     <div class="card text-center border-dark mb-3 gap-l2" style="width: 500px;">
						  <img height="250px" width="400px" class="card-img-top" src='images/sportsmeet' alt="Card image cap">
						  <div class="card-body text-dark">
						    <h3 class="card-title">Faculty Sports Meet</h3>
						    <p class="card-text"><h4>Congratulations to all the faculty who won the games!</h4></p>
						    <a href="#" class="btn btn-primary">View Page</a>
						  </div>
						</div>
					  </div>
					</div>
					<div onclick="eveFunc()" class="back position2">
				    <div class="button_base b03_skewed_slide_in">
				        	<div>Events>></div>
				        	<div></div>
				        	<div>Events>></div>
				    	</div>
					</div>
			</div>
		</div>
	</div>

</body>
</html>
