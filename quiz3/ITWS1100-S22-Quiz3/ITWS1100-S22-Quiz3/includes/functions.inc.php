<?php

function buildMenu() {
  // create an array of URLs and labels
	$menu = array(
		'index' => 'actors',
		'movies' => 'movies'
	);
	// construct the menu, setting the current menu item 'selected' if 
	// we are on the page that matches the URL
	$menuOutput = '<ul id="menu">';
	foreach ($menu as $key => $value) {
		if($_SERVER['PHP_SELF'] == "$key.php") {
			$selected = ' class="selected"';
		} else {
			$selected = '';
		}
		$menuOutput .= '<li' . $selected . '><a href="' . $key . '.php" title="' . $value . '">' . $value . '</a></li>';
	}
	$menuOutput .= '</ul>';
  return $menuOutput;
}

?>
