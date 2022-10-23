<?php
include_once "connect.php";
$idEvents = mysqli_real_escape_string($db, $_POST['idEvents']);
$idAccount = mysqli_real_escape_string($db, $_POST['idAccount']);
$sql = "SELECT 1 FROM eventsInfo WHERE idAccount = '" . $idAccount . "' AND idEvents = '" . $idEvents . "' LIMIT 1;";
$result = mysqli_query($db, $sql);

$data;
if ($result) {
    $data = mysqli_fetch_assoc($result);
    $element = json_encode($data);

    if (strval($element) != "null") {
        $delete = "DELETE FROM `eventsInfo` WHERE idAccount = $idAccount AND idEvents = $idEvents;";
        $result2 = mysqli_query($db, $delete);
        $result2->close();
    } else {
        $add = "INSERT INTO `eventsInfo`(`id`, `idEvents`, `idAccount`) VALUES (null,'$idEvents','$idAccount');";
        $result3 = mysqli_query($db, $add);
        $result3->close();
    }
    $result->close();
    $db->close();
}
