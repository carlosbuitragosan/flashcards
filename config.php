<?php

require_once __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad();

function getPDO(): PDO
{
    $driver = $_ENV['DB_CONNECTION'];
    $host = $_ENV['DB_HOST'];
    $port = $_ENV['DB_PORT'];
    $dbName = $_ENV['DB_NAME'];
    $user = $_ENV['DB_USER'];
    $pass = $_ENV['DB_PASSWORD'];
    $dsn = "$driver:host=$host;port=$port;dbname=$dbName;charset=utf8mb4";

    try {
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Could not connect to the database: " . $e->getMessage());
    }
}
