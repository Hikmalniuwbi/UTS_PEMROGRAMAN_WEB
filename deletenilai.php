<?php
// Koneksi ke database dengan require_once
require_once __DIR__ . "/connect.php";

// Ambil parameter NIM baik dari POST maupun GET
$nim = '';
if (isset($_POST['nim'])) {
    $nim = trim($_POST['nim']);
} elseif (isset($_GET['nim'])) {
    $nim = trim($_GET['nim']);
}

if (!empty($nim)) {
    $sql = "DELETE FROM nilaimhsw WHERE nim = '$nim'";

    if ($conn->query($sql) === TRUE) {
        // Redirect kembali ke halaman asal (viewdata.php atau datatable.php)
        $redirect = isset($_REQUEST['redirect']) && !empty($_REQUEST['redirect'])
            ? $_REQUEST['redirect']
            : (isset($_SERVER['HTTP_REFERER']) ? $_SERVER['HTTP_REFERER'] : 'viewdata.php');
        header("Location: " . $redirect);
        exit();
    } else {
        echo "Error deleting record: " . $conn->error;
    }
} else {
    header("Location: viewdata.php");
    exit();
}
?>