<?php
	require_once('dbconn.php');
	//echo $_SESSION['menu']."project based menu";
	$_POST['menu']['parent'] = 0;
	//echo "select * from menu where id in (".$_SESSION['menu'].")";
	$menus_qry = mysqli_query($dbconn,"select * from menu");
	while($record = mysqli_fetch_assoc($menus_qry)){
		$menus[$record['parent']][$record['id']] = $record;
	}
	// print('<pre>');print_r($getmenu);print('</pre>');
		// echo $getmenu[0][1]['parent'];
?>