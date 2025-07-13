<?php

require_once __DIR__ . '/../config.php';

$API_URL = 'https://restcountries.com/v3.1/all?fields=name,capital,region';
$response = file_get_contents($API_URL);

// assign db deck_id to api regions
function getRegionId(PDO $pdo, string $region): int
{
    $stmt = $pdo->prepare("SELECT id FROM decks WHERE continent = ?");
    $stmt->execute([$region]);
    return $stmt->fetchColumn();
}

// check if the response is ok
if ($response === false) {
    die("Failed to fetch data from API.");
}

// return an assoc array
$data = json_decode($response, true);

//get db connection
$pdo = getPDO();

// check insertion
$skipped = 0;
$inserted = 0;

// loop through each country
foreach ($data as $country) {
    //verify country, capital, and region exist
    if (empty($country['capital']) || empty($country['region']) || empty($country['name']['common'])) {
        $skipped++;
        continue;
    }
    $name = $country['name']['common'];
    $capital = $country['capital'][0];
    $region = $country['region'];
    $deckId = getRegionId($pdo, $region);

    try {
        $stmt = $pdo->prepare("INSERT INTO flashcards (country, capital, deck_id) VALUES (?, ?, ?)");
        $stmt->execute([$name, $capital, $deckId]);
        $inserted++;
    } catch (PDOException $e) {
        echo "Warning: " . $e->getMessage() . "\n";
        continue;
    }
}

echo "Inserted: $inserted\n";
echo "Skipped: $skipped\n";
