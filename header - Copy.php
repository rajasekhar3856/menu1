<?php error_reporting(0);
include 'dbconn.php';
if($_SESSION['id']==''){
	header('Location:login.php');
}
?>
 <header class="header dark-bg">
            <div class="toggle-nav">
                <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
            </div>

            <!--logo start-->
            <a href="index.php" class="logo"><img alt="" src="images/css.png" style="width:130px;height:37px;border-radius:0%;"></span></a>
            <!--logo end-->

            <div class="nav search-row" id="top_menu">
                <!--  search form start -->
                <!--<ul class="nav top-menu">                    
                    <li>
                        <form class="navbar-form">
                            <input class="form-control" placeholder="Search" type="text">
                        </form>
                    </li>                    
                </ul>-->
                <!--  search form end -->                
            </div>

            <div class="top-nav notification-row">                
                <!-- notificatoin dropdown start-->
                <ul class="nav pull-right top-menu">
                    
                    <!-- task notificatoin start 
                    <li id="task_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-task-l"></i>
                            <span class="badge bg-important">1</span>
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 6 pending letter</p>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="task-info">
                                        <div class="desc">Design PSD </div>
                                        <div class="percent">90%</div>
                                    </div>
                                    <div class="progress progress-striped">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" style="width: 90%">
                                            <span class="sr-only">90% Complete (success)</span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                            
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
                        </ul>
                    </li>-->
                    <!-- task notificatoin end -->
                    <!-- inbox notificatoin start
                    <li id="mail_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <i class="icon-envelope-l"></i>
                            <span class="badge bg-important">1</span>
                        </a>
                        <ul class="dropdown-menu extended inbox">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 5 new messages</p>
                            </li>
                            <li>
                                <a href="#">
                                    <span class="photo"><img alt="avatar" src="./img/avatar-mini1.jpg"></span>
                                    <span class="subject">
                                    <span class="from">Rajasekhar</span>
                                    <span class="time">1 min</span>
                                    </span>
                                    <span class="message">
                                        I really like this admin panel.
                                    </span>
                                </a>
                            </li>
                            
                            <li>
                                <a href="#">See all messages</a>
                            </li>
                        </ul>
                    </li>-->
                    <!-- inbox notificatoin end -->
                    <!-- alert notification start
                    <li id="alert_notificatoin_bar" class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">

                            <i class="icon-bell-l"></i>
                            <span class="badge bg-important">1</span>
                        </a>
                        <ul class="dropdown-menu extended notification">
                            <div class="notify-arrow notify-arrow-blue"></div>
                            <li>
                                <p class="blue">You have 4 new notifications</p>
                            </li>
                           
                            <li>
                                <a href="#">
                                    <span class="label label-warning"><i class="icon_pin"></i></span>  
                                    John.
                                    <span class="small italic pull-right">50 mins</span>
                                </a>
                            </li>
                                                       
                            <li>
                                <a href="#">See all notifications</a>
                            </li>
                        </ul>
                    </li>-->
                    <!-- alert notification end-->
                    <!-- user login dropdown start-->
					<li style="padding-top:12px;">
					
					<?php
						$c=array();
						$c =$_SESSION['projectname'];
						$length=count($c);
						// if($c[i] == 'All'){
							// echo "All is well";
						// }else{
							// echo "All is bad";
						// }
						if(isset($_POST['myselectproject']))
						{
							$_SESSION['project']=$_POST['myselectproject'];
							$selectm = mysqli_query($dbconn,"select * from core_usergroup where projectname = '".$_SESSION['project']."'");
							$getmenu = mysqli_fetch_array($selectm);
							$_SESSION['menu'] = $getmenu["menu"];
							// echo $_SESSION['menu'];
						}
						?>
						<form method="POST">
							<?php 
								for($i = 0; $i < $length; $i++){
								if($c[$i] == 'All'){
									// echo "Yes";
									// echo "select * from core_usergroup where projectname = '".$c[$i]."'";
									$selectm1 = mysqli_query($dbconn,"select * from core_usergroup where status = 'active'");
									?>
									<select name="myselectproject" id="myselect" onchange="this.form.submit()">
										<option value="<?php echo $_SESSION["project"];?>" selected><?php echo $_SESSION["project"];?></option>
										<?php while($getmenu1 = mysqli_fetch_array($selectm1)){ ?>
											
											<option value="<?php echo $getmenu1["projectname"]; ?>"><?php echo $getmenu1["projectname"]; ?></option>
										<?php } ?>
									</select>
										 <?php
										
								}else{
									// echo "No";
									?>
									
									<select name="myselectproject" id="myselect" onchange="this.form.submit()">
									<?php 
										for($i = 0; $i < $length; $i++){
										  ?>
										<option <?php if($c[$i]==$_SESSION['project']){echo "selected";} ?> value="<?php echo $c[$i]; ?>"><?php echo $c[$i]; ?></option>
										 <?php
										}
										?>
									</select>
									<?php
								}
								}
							?>
						</form>
					
					</li>
					<?php
					// $selectm = mysqli_query($dbconn,"select * from core_usergroup where projectname = '".$_SESSION['project']."'");
					// $getmenu = mysqli_fetch_array($selectm);
					// while($getmenu = mysqli_fetch_array($selectm)){
						// echo $getmenu["menu"];
					// }
					?>
					<li style="padding-top:12px;">
					
					<?php
						$b = array();
						$b=explode(',',$_SESSION['usertype']);
							if(isset($_POST['myselect']))
							{
							$_SESSION['role']=$_POST['myselect'];
							echo $_SESSION['role'];
							}
							$length=count($b);
							
							?>
						<form method="POST">
							<select name="myselect" id="myselect" onchange="this.form.submit()">
								<?php 
								for($i = 0; $i < $length; $i++){
								  ?>
								  <option <?php if($b[$i]==$_SESSION['role']){echo "selected";} ?> value="<?php echo $b[$i]; ?>"><?php echo $b[$i]; ?></option>
								  <?php
								}
								?>
								
							</select>
						</form>
						
					<?php if($_SESSION['name']){
					?>	
					</li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="username">Welcome <?php echo $_SESSION['name']; ?></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout">
                            <div class="log-arrow-up"></div>
                            <!--<li class="eborder-top">
                                <a href="#"><i class="icon_profile"></i> My Profile</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_mail_alt"></i> My Inbox</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_clock_alt"></i> Timeline</a>
                            </li>
                            <li>
                                <a href="#"><i class="icon_chat_alt"></i> Chats</a>
                            </li>-->
                            <li>
                                <a href="logout.php"><i class="icon_key_alt"></i> Log Out</a>
                            </li>
                        </ul>
                    </li>
					<?php
					}else{
						?>
						<li>
							<a href="login.php"  style="color:white !important;">
								Login
							</a>
						</li>
						<?php
					}
					?>
					
                    <!-- user login dropdown end -->
                </ul>
                <!-- notificatoin dropdown end-->
            </div>
      </header>      
      <!--header end-->
	  <style>
.sub .subli{
	 background-color:#88929b !important;
}
.sub .subli .suba:hover{
	 background-color:#9b8892 !important;
}
</style>
<aside>
          <div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu"> 
				<?php 
					$header_getmenu = array();
					// $menu_parent = array();
					// $menu_child = array();
						$header_getmenu = explode(',',$_SESSION['menu']);
						/*for($j=0;$j<sizeof($header_getmenu);$j++){
							$selectm = mysqli_query($dbconn,"select * from menu where id =".$header_getmenu[$j]);
							while($getmenu = mysqli_fetch_array($selectm)){
								if($getmenu['parent'] == 0){
									$menu_parent = $header_getmenu[$j];
								}else{
									$menu_child = $header_getmenu[$j];
								}
							}
						}*/
						
						// for($i=0;$i < sizeof($menu_parent); $i++){
							// $selectmenu = mysqli_query($dbconn,"select * from menu where id =".$menu_parent[$i]);
							// while($getmenu = mysqli_fetch_array($selectmenu)){
								
							// }
						// }
						//echo "CALL sp_menu_getmenu('".$_SESSION['menu']."')";
						$length_menu = sizeof($header_getmenu);
						// $result_c = array_intersect($getmenu, $header_getmenu);
						// echo $result_c[1];
					// for($i=0;$i < $length_menu; $i++){
							//echo "select * from menu where id =".$header_getmenu[$i];
						
						// $selectm = mysqli_query($dbconn,"CALL sp_menu_getmenu('".$_SESSION['menu']."')");//1,2,3,4,7,8,9,10,11
						// while($getmenu = mysqli_fetch_array($selectm)){
							include('project_based_menu.php');
							echo $getmenu[0][5]['id'];
							$parent = $_POST['menu']['parent'];
							if(isset($getmenu[$parent])){
								//echo $getmenu[0][1]['id'];
							foreach($getmenu[$parent] as $key => $getmenu){
								if(isset($getmenu[$getmenu['id']])){
									echo $getmenu['label']."Yes"; 
									// echo $getmenu['link']; 
									?>
									<li class="active">
										  <a class="" href="<?php echo $getmenu['link']; ?>">
											  <i class="<?php echo $getmenu['icon']; ?>"></i>
											  <span><?php echo $getmenu['label']; 
												$_POST['menu']['parent'] = $getmenu['id'];
												include('project_based_menu.php');
											  ?></span>
											  <!--<span class="menu-arrow arrow_carrot-right"></span>-->
										  </a>
										  <?Php
											
								}else{
									// echo $getmenu['id']."NO"."<br>";
											// echo "javascript:;"; 
											// echo $_SESSION["menu"]; // selected menu list
											//echo "select * from menu where parent =".$getmenuid;
												// $selectm1 = mysqli_query($dbconn,"select * from menu where parent ='$getmenuid'");
												// while($getmenu1 = mysqli_fetch_array($selectm1)){
													?>
														<ul class="sub">
															<!--<li class="subli"><a class="suba" href="documents1.php">Documents1</a></li>-->
															<li class="subli"><a class="suba" href="<?php echo $getmenu['link']; ?>"><?php echo $getmenu['label']; ?></a></li>
														</ul>
														<?php
													}
									  ?>
										
								</li>
							<?php
							}
							}
							
						// }
					// }
				
				
				
				?>
                  <!---<li class="active">
                      <a class="" href="index.php">
                          <i class="icon_house_alt"></i>
                          <span>Home</span>
                      </a>
                  </li>
				  <li class="sub-menu">
                      <a href="reports.php" class="">
                          <i class="icon_document_alt"></i>
                          <span>Reports</span>
                      </a>
                  </li>       
                  <li class="sub-menu">
                      <a href="Dashboard.php" class="">
                          <i class="icon_desktop"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
                  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_genius"></i>
                          <span>Data Repository</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
                          <li class="subli"><a class="suba" href="contract_documents.php">Contract Documents</a></li>
                          <li class="subli"><a class="suba" href="review_meeting.php">Review Meeting</a></li>
                      </ul>
                  </li> 
				  <?php 
							
								if($_SESSION['role']!='User'){
							?>
				  <li class="sub-menu">
                      <a href="javascript:;" class="">
                          <i class="icon_table"></i>
                          <span>Masters</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
                      <ul class="sub">
							
							<li class="subli"><a class="suba" href="employee.php">Employee</a></li>
							<li class="subli"><a class="suba" href="customer.php">Customer</a></li>
                          <li class="subli"><a class="suba" href="project.php">Project</a></li>
                          <li class="subli"><a class="suba" href="channel.php">Channel</a></li>
                          <li class="subli"><a class="suba" href="language.php">Language</a></li>
                          <li class="subli"><a class="suba" href="location.php">Location</a></li>
                          <li class="subli"><a class="suba" href="metrics.php">Metrics</a></li>
                          <li class="subli"><a class="suba" href="billing.php">Billing</a></li>
                          <li class="subli"><a class="suba" href="wbs.php">WBS Structure</a></li>		
                          <li class="subli"><a class="suba" href="role.php">Role</a></li>		
                          <li class="subli"><a class="suba" href="usergroup.php">User Group</a></li>		
							
							
                      </ul>
                  </li>-->
				  <?php
								}
							?> 
              </ul>
              <!-- sidebar menu end-->
          </div>
      </aside>
      <!--sidebar end-->
	  
	  <?php 
	// $menus_qry = mysqli_query($dbconn,"select * from menu where id IN 1,2,3,4,7,8,9,10,11");
	// while($record = mysqli_fetch_array($menus_qry)){
		// $menus[$record['parent']][$record['id']] = $record;
	// }
?>

<?php
//create a page menus.php pass data parent,menus to that page
	// if(isset($menus[$parent])) {
		// foreach ($menus[$parent] as $key => $menu) {
			// if(isset($menus[$menu['id']])){ ?>
				<!-- <ul class="sub">
					 <?php //include('menu.php',array('menus'=>$menus,'parent'=>$menu['id'])); ?>
				</ul>-->
			 <? //}
			// else{ ?>
				<!--<li class="active">
					<a class="" href="<?php //echo $menu['link']; ?>">
						<i class="<?php //echo $menu['icon']; ?>"></i><span><?php //echo $menu['label']; ?></span>
					</a>
				</li>-->
			 <?php //}
		// }
	// }						
?>