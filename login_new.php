<?php
session_start();
include 'dbconn.php';
if(isset($_POST['submit'])){
	$username = $_POST['username'];
	$password = $_POST['password'];
	echo "select * from employee where emp_no='$username' and emp_password='$password'";
	$select = mysqli_query($dbconn,"select * from employee where emp_no='$username' and emp_password='$password'");
	if($result = mysqli_fetch_array($select)){
		$_SESSION['id'] = $result['emp_no'];
		//echo $_SESSION['id'];
		$_SESSION['name'] = $result['emp_name'];
		$_SESSION['usertype'] = $result['emp_usertype'];
		$_SESSION['role'] = "User";
		$_SESSION['usergroup'] = $result['emp_usergroup'];
		$b = array();
		$b=explode(',',$_SESSION['usergroup']);
		if($_SESSION['id']){
			$_SESSION['projectname'] = array();
			for($i=0;$i<sizeof($b);$i++){
				echo "select * from core_usergroup where status='active' and groupname='".$b[$i]."'";
				$select1 = mysqli_query($dbconn,"select * from core_usergroup where status='active' and groupname='".$b[$i]."'");
				while($user_result = mysqli_fetch_array($select1)){
					$_SESSION['groupname'] = $user_result['groupname'];
					//$_SESSION['projectname'] = $user_result['projectname'];
					array_push($_SESSION['projectname'],$user_result['projectname']);
					$_SESSION['menu'] = $user_result['menu'];
					$_SESSION['projectname'][0];
				}
			}	
		}
		header('Location:index.php');
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
    <meta name="author" content="GeeksLabs">
    <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>Login Page | MIS ADMIN</title>

    <!-- Bootstrap CSS -->    
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- bootstrap theme -->
    <link href="css/bootstrap-theme.css" rel="stylesheet">
    <!--external css-->
    <!-- font icon -->
    <link href="css/elegant-icons-style.css" rel="stylesheet" />
    <link href="css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

  <body class="login-img3-body">

    <div class="container">
        
        

      <form class="login-form" action="" method="post">        
        
		<div class="login-wrap">
            Note: Password is password<p class="login-img"><i class="icon_lock_alt"></i></p>
            
            <div class="input-group">
              <span class="input-group-addon"><i class="icon_profile"></i></span>
              <input type="text" class="form-control" name="username" placeholder="Emp ID" autofocus>
            </div>
            <div class="input-group">
                <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                <input type="password" class="form-control" name="password" placeholder="Password">
            </div>
            <label class="checkbox">
                <input type="checkbox" value="remember-me"> Remember me
                <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
            </label>
            <input class="btn btn-primary btn-lg btn-block" name="submit" type="submit" value="Login">
            <!--<button class="btn btn-info btn-lg btn-block" type="submit">Signup</button>-->
        </div>
      </form>
    <div class="text-right">
            <div class="credits">
                <!-- 
                    All the links in the footer should remain intact. 
                    You can delete the links only if you purchased the pro version.
                    Licensing information: https://bootstrapmade.com/license/
                    Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
                -->
               
            </div>
        </div>
    </div>


  </body>
</html>