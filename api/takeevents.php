<?php
include_once "connect.php";
$id = mysqli_real_escape_string($db, $_GET['id']);
// $sql = "SELECT events.id, events.name, events.date FROM accounts INNER JOIN events ON events.idAccount = accounts.id INNER JOIN eventsInfo ON eventsInfo.idAccount = events.idAccount WHERE accounts.id = '" . $id . "';";
$sql = "SELECT events.id, events.name, DATE_FORMAT(events.date, '%d.%m.%Y') as date FROM events INNER JOIN eventsInfo ON events.id = eventsInfo.idEvents WHERE eventsInfo.idAccount = '" . $id . "' ORDER BY date;";
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
