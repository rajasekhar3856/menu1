<?php

//create a page menus.php pass data parent,menus to that page
$parent = $_POST['menu']['parent'];
// echo $parent;
if(isset($menus[$parent])) {
	foreach ($menus[$parent] as $key => $menu) {
		if(isset($menus[$menu['id']])){ ?>
			<li class="sub-menu">
				<a href="javascript:;" class="">
							  <i class="<?php echo $menu['icon']; ?>"></i>
							  <span><?php print $menu['label'];?></span>
							  <span class="menu-arrow arrow_carrot-right"></span>
						  </a>
				<ul class="sub">
					<?php
					$_POST['menu']['parent']= $menu['id']; 
					include('menu.php'); 
					?>
				 
				</ul>
			  </li>
			
		<?php }
		else{ ?>
		<li>
			<a class="" href="index.php">
				<i class="<?php echo $menu['icon']; ?>"></i>
				<span><?php echo $menu['label']; ?></span>
            </a>
		</li>
			
		<?php }
	}
}						
?>