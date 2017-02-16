<?php 
function enqueue_my_scripts() {
    wp_enqueue_script('theme-js', get_stylesheet_directory_uri() . '/app.bundle.js');
}
add_action( 'wp_enqueue_scripts', 'enqueue_my_scripts' );

function register_menu() {
  register_nav_menu( 'main_nav', 'Main Navigation Menu' );
}
add_action( 'after_setup_theme', 'register_menu' );