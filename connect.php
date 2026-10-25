<?php
// definisi nilai paramter server
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "db_nilai5a";

// Create connection
// $conn = new mysqli("localhost", "root", "");
$conn = mysqli_connect($servername, $username, $password, $dbname);

// Check connection
if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}
// echo "<script>alert('Connected successfully')</script>>";
// echo ("Connect successfully");
?>