<?php
include_once "connect.php";
$idAccount = mysqli_real_escape_string($db, $_GET['idAccount']);
$sql = "SELECT id, name, DATE_FORMAT(date, '%d.%m.%Y') as date FROM events WHERE idAccount = '" . $idAccount . "' ORDER BY date;";
$result = mysqli_query($db, $sql);

$list = array();
if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        $list[] = $row;
    }
    echo json_encode($list);
    $result->close();
    $db->close();
}
