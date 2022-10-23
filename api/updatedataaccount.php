<?php
include_once "connect.php";
$type = mysqli_real_escape_string($db, $_GET['type']);
$data = mysqli_real_escape_string($db, $_POST['data']);
$id = mysqli_real_escape_string($db, $_POST['id']);
if ($type == "Imię i nazwisko") {
    $sql = "UPDATE accounts SET fullname = '" . $data . "' WHERE id = '" . $id . "';";
} else if ($type == "Wiek") {
    $sql = "UPDATE accounts SET age = '" . $data . "' WHERE id = '" . $id . "';";
} else if ($type == "Miasto") {
    $sql = "UPDATE accounts SET city = '" . $data . "' WHERE id = '" . $id . "';";
} else if ($type == "Numer telefonu") {
    $sql = "UPDATE accounts SET numberPhone = '" . $data . "' WHERE id = '" . $id . "';";
} else {
    $sql = "UPDATE accounts SET sex = '" . $data . "' WHERE id = '" . $id . "';";
}

$result = mysqli_query($db, $sql);


if ($result) {
    echo "Udało się zmienić " + $type;
    $result->close();
    $db->close();
}
