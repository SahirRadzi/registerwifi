<?php

include 'connect.php';

session_start();
session_unset();
session_destroy();

header('location:../rwopanel/admin_login.php');

?>