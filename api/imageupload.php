<?php
include_once "connect.php";

$data = mysqli_real_escape_string($db, $_POST['data']);
$namePhoto = mysqli_real_escape_string($db, $_POST['namePhoto']);
$path = "photo/$namePhoto";

$id = mysqli_real_escape_string($db, $_POST['idAccount']);
$name = mysqli_real_escape_string($db, $_POST['name']);
$description = mysqli_real_escape_string($db, $_POST['description']);
$city = mysqli_real_escape_string($db, $_POST['city']);
$date = mysqli_real_escape_string($db, $_POST['date']);


$sql = "INSERT INTO `events`(`idAccount`, `id`, `name`, `description`, `city`, `date`, `url`) VALUES ('$id','','$name','$description','$city','$date','$path');";
$sql2 = "INSERT INTO `eventsInfo` (`id`, `idEvents`, `idAccount`) VALUES (NULL, (SELECT MAX(id) FROM events), '$id');";

$arr = [];

$exe = mysqli_query($db, $sql);

if ($exe) {
    $arr["Success"] = "true";
} else {
    $arr["Success"] = "false";
}
$exe2 = mysqli_query($db, $sql2);

print(json_encode($arr));
file_put_contents($path, base64_decode($data));

$db->close();
