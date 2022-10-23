<?php
include_once "connect.php";
$login = mysqli_real_escape_string($db, $_POST['login']);
$pass = mysqli_real_escape_string($db, $_POST['pass']);

$sql = "SELECT pass FROM accounts WHERE email = '" . $login . "'";
$result = mysqli_query($db, $sql);
$data;
$hash;
if ($result) {
    $data = mysqli_fetch_row($result);
    $hash = $data[0];
    if (password_verify($pass, $hash)) {
        $sql2 = "SELECT id, fullname, url FROM accounts WHERE email = '" . $login . "';";
        $result2 = mysqli_query($db, $sql2);
        $data2;
        if ($result2) {
            $data2 = mysqli_fetch_assoc($result2);
            echo json_encode($data2);
            $result2->close();
        }
    } else {
        echo "Błędny e-mail lub hasło.";
    }
}
$result->close();
$db->close();
