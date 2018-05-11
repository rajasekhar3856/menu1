<?php
	require_once('dbconn.php');
	//echo $_SESSION['menu']."project based menu";
	$_POST['menu']['parent'] = 0;
	$menus_qry = mysqli_query($dbconn,"CALL sp_menu_getmenu('".$_SESSION['menu']."')");
	while($record = mysqli_fetch_array($menus_qry)){
		$getmenu[$record['parent']][$record['id']] = $record;
		//print_r($getmenu[$record['parent']][$record['id']]);
	}
		// echo $getmenu[0][1]['parent'];
?>