<?php
include_once "connect.php";
$id = mysqli_real_escape_string($db, $_GET['id']);
$sql = "SELECT accounts.id, accounts.fullname, accounts.url FROM accounts INNER JOIN eventsInfo ON accounts.id = eventsInfo.idAccount WHERE eventsInfo.idEvents = '" . $id . "';";
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
