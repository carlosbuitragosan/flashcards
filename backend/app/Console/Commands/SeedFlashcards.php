<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\DB;
use App\Models\Deck;
use App\Models\Flashcard;

class SeedFlashcards extends Command
{
    protected $signature = 'flashcards:seed';
    protected $description = 'Seed the flashcards table with country data from the REST Countries API';

    public function handle()
    {
        $apiUrl = 'https://restcountries.com/v3.1/all?fields=name,capital,region,flags,cca2';

        $this->info('Fetching country data...');
        $response = Http::get($apiUrl);

        if ($response->failed()) {
            $this->error('Failed to fetch data from the API.');
            return Command::FAILURE;
        }

        $countries = $response->json();
        $inserted = 0;
        $skipped = 0;
        $skippedCountries = [];

        foreach ($countries as $country) {
            if (
                empty($country['name']['common'] ?? null) ||
                empty($country['capital'][0] ?? null) ||
                empty($country['region'] ?? null)
            ) {
                $skipped++;
                $skippedCountries[] = $country['name']['common'] ?? 'unknown';
                continue;
            }

            $region = $country['region'];
            $deck = Deck::firstOrCreate(['continent' => $region]);

            try {
                Flashcard::updateOrCreate(
                    ['country' => $country['name']['common']],
                    [
                    'code' => $country['cca2'] ?? null,
                    'capital' => $country['capital'][0],
                    'deck_id' => $deck->id,
                    'flag' => $country['flags']['svg'] ?? null,
                    'flag_alt' => $country['flags']['alt'] ?? null,
                ]
                );
                $inserted++;
            } catch (\Exception $e) {
                $skipped++;
                $skippedCountries[] = $country['name']['common'] ?? 'unknown';
                $this->warn("Skipped {$country['name']['common']}: {$e->getMessage()}");
            }
        }

        $this->info("Inserted: $inserted");
        $this->info("Skipped: $skipped");

        if (!empty($skippedCountries)) {
            $this->newLine();
            $this->warn("Skipped Countries:");
            foreach ($skippedCountries as $name) {
                $this->line("- $name");
            }
        }

        return Command::SUCCESS;
    }
}
