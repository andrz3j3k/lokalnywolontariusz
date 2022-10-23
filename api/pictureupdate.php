<?php
include_once "connect.php";

$data = mysqli_real_escape_string($db, $_POST['data']);
$namePhoto = mysqli_real_escape_string($db, $_POST['namePhoto']);
$path = "photo/$namePhoto";

$id = mysqli_real_escape_string($db, $_POST['idAccount']);

$sql = "UPDATE accounts SET url = '" . $path . "' WHERE accounts.id = '" . $id . "';";

$arr = [];

$exe = mysqli_query($db, $sql);
if ($exe) {
    $arr["Success"] = "true";
} else {
    $arr["Success"] = "false";
}

print(json_encode($arr));
file_put_contents($path, base64_decode($data));

$db->close();
