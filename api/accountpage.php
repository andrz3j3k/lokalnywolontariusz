<?php
include_once "connect.php";
$id = mysqli_real_escape_string($db, $_POST['id']);
$sql = "SELECT fullname, city, age, numberPhone, url FROM accounts WHERE id = '" . $id . "';";
$result = mysqli_query($db, $sql);

if ($result) {
    $data = mysqli_fetch_assoc($result);
    echo json_encode($data);
    $result->close();
    $db->close();
}
