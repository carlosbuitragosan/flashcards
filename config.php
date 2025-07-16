<?php

$envFile = __DIR__ . '/.env';

if (file_exists($envFile)) {
    $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        putenv($line);
    }
}

function getPDO(): PDO
{
    $driver = getenv('DB_CONNECTION');
    $host = getenv('DB_HOST');
    $port = getenv('DB_PORT');
    $dbName = getenv('DB_NAME');
    $user = getenv('DB_USER');
    $pass = getenv('DB_PASSWORD');
    $dsn = "$driver:host=$host;port=$port;dbname=$dbName;charset=utf8mb4";

    try {
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Could not connect to the database: " . $e->getMessage());
    }
}
