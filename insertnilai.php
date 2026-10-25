<?php
// koneksi db
require_once __DIR__ . "/connect.php";

// require_once latihan.php untuk mengambil function hitungNilai()
if (file_exists(__DIR__ . "/latihan.php")) {
    require_once __DIR__ . "/latihan.php";
} else {
    require_once __DIR__ . "/../latihan.php";
}

// data yang akan di isi ke tabel
$nim = isset($_POST['nim']) ? mysqli_real_escape_string($conn, trim($_POST['nim'])) : '';
$namamhsw = isset($_POST['namamhsw']) ? mysqli_real_escape_string($conn, trim($_POST['namamhsw'])) : '';
$nilaiakhir = isset($_POST['nilaiakhir']) ? floatval($_POST['nilaiakhir']) : 0;
$redirect = isset($_POST['redirect']) && !empty($_POST['redirect']) ? $_POST['redirect'] : 'viewdata.php';

// Hitung nilai huruf dan predikat dari function di latihan.php
$hasil = hitungNilai($nilaiakhir);
$nilaihuruf = $hasil['nilaihuruf'];
$predikat = $hasil['predikat'];

// Tanggal otomatis
$create_date = date('Y-m-d H:i:s');
$modified_date = date('Y-m-d H:i:s');

// Proses upload foto jika ada
$file_path = NULL;
if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
    $target_dir = __DIR__ . "/uploads/";
    if (!file_exists($target_dir)) {
        mkdir($target_dir, 0777, true);
    }

    $filename = basename($_FILES["foto"]["name"]);
    $imageFileType = strtolower(pathinfo($filename, PATHINFO_EXTENSION));

    // Validasi tipe file gambar sesuai materi upload.php
    $allowed_types = ['jpg', 'jpeg', 'png', 'gif', 'webp'];
    if (in_array($imageFileType, $allowed_types)) {
        $clean_name = preg_replace("/[^a-zA-Z0-9\._-]/", "", $filename);
        $new_filename = time() . "_" . $clean_name;
        $target_file = $target_dir . $new_filename;

        if (move_uploaded_file($_FILES["foto"]["tmp_name"], $target_file)) {
            $file_path = "uploads/" . $new_filename;
        }
    }
}

// kueri insert data ke dalam table
if ($file_path !== NULL) {
    $file_path_safe = mysqli_real_escape_string($conn, $file_path);
    $sql = "INSERT INTO nilaimhsw (nim, namamhsw, nilaiakhir, nilaihuruf, predikat, create_date, modified_date, file_path)
            VALUES ('$nim', '$namamhsw', '$nilaiakhir', '$nilaihuruf', '$predikat', '$create_date', '$modified_date', '$file_path_safe')";
} else {
    $sql = "INSERT INTO nilaimhsw (nim, namamhsw, nilaiakhir, nilaihuruf, predikat, create_date, modified_date)
            VALUES ('$nim', '$namamhsw', '$nilaiakhir', '$nilaihuruf', '$predikat', '$create_date', '$modified_date')";
}

if (mysqli_query($conn, $sql)) {
    // Redirect ke halaman asal agar langsung menampilkan data terbaru
    header('Location: ' . $redirect);
    exit();
} else {
    echo "Error: " . $sql . "<br>" . mysqli_error($conn);
}
?>