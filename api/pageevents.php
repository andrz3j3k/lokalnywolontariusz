<?php
include_once "connect.php";

$id = mysqli_real_escape_string($db, $_GET['id']);
$sql = "SELECT accounts.id, accounts.fullname, accounts.email, accounts.numberPhone, events.name, events.description, events.city, events.url, accounts.url as accountsUrl, DATE_FORMAT(events.date, '%d.%m.%Y') as date, COUNT(eventsInfo.idAccount) as countAccounts FROM events INNER JOIN accounts ON accounts.id = events.idAccount INNER JOIN eventsInfo ON eventsInfo.idEvents = events.id WHERE events.id = '" . $id . "' ORDER BY date;";
$result = mysqli_query($db, $sql);

if ($result) {
    $data = mysqli_fetch_assoc($result);
    echo json_encode($data);
    $result->close();
    $db->close();
}
