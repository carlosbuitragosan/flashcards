<?php

function getPDO(): PDO
{
    try {
        $pdo = new PDO("pgsql:host=localhost;dbname=flashcards", 'carlosbuitrago', '');
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        return $pdo;
    } catch (PDOException $e) {
        die("Could not connect to the database: " . $e->getMessage());
    }
}
