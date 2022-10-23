<?php
include_once "connect.php";
$fullname = mysqli_real_escape_string($db, $_POST['fullname']);
$email = mysqli_real_escape_string($db, $_POST['email']);
$pass = mysqli_real_escape_string($db, $_POST['pass']);

$password = password_hash($pass, PASSWORD_DEFAULT);

$sql2 = "SELECT email FROM accounts WHERE email = '" . $email . "'";
$result2 = mysqli_query($db, $sql2);
if ($result2) {
    $data = mysqli_fetch_assoc($result2);
    $element = json_encode($data);

    if (strval($element) != "null") {
        echo "Istnieje juz taki uzytkownik!";
    } else {
        echo "Konto zostało utworzone!";
        $sql = "INSERT INTO `accounts`(`email`, `pass`, `fullname`) VALUES ('$email','$password','$fullname')";
        $result = mysqli_query($db, $sql);
        $result->close();
    }
    $result2->close();
    $db->close();
}
