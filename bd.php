<?php
// Получение данных из POST запроса
$name = filter_var(trim($_POST['name']));
$email = filter_var(trim($_POST['email']));
$telephone = filter_var(trim($_POST['telephone']));
$date = filter_var(trim($_POST['date']));

// Установка соединения с базой данных
$servername = "localhost";
$username = "sqluser";
$password = "password";
$dbname = "sqluser";

// Подключение к базе данных и проверка соединения
$sql = new mysqli($servername, $username, $password, $dbname);
if ($sql->connect_error) {
    die("Ошибка подключения: " . $sql->connect_error);
}

$sql->set_charset("utf8mb4");

// Подготовка и выполнение запроса INSERT
try {
    $stmt = $sql->prepare("INSERT INTO предварительназапись (ИмяКлиента, Email, Телефон, Дата) VALUES (?, ?, ?, ?)");
    if (!$stmt) {
        throw new Exception($sql->error);
    }
    
    $stmt->bind_param("ssss", $name, $email, $telephone, $date);
    
    if (!$stmt->execute()) {
        throw new Exception($stmt->error);
    }
    
    $stmt->close();
    echo "Данные успешно занесены в базу данных!";
} catch (Exception $e) {
    echo "Ошибка: " . $e->getMessage();
}
header('Location: /');  
?>
 