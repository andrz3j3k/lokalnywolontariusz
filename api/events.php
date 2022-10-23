<?php
include_once "connect.php";

$sql = "SELECT events.id, events.name, events.city, events.url, DATE_FORMAT(events.date, '%d.%m.%Y') as date FROM events ORDER BY date;";
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
