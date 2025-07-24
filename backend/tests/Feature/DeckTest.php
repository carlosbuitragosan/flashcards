<?php

namespace Tests\Feature;

use App\Models\Deck;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class DeckTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_returns_all_continents(): void
    {
        \App\Models\Deck::factory()->count(5)->create();
        $response = $this->getJson('/api/decks');
        $response
        ->assertOk()
        ->assertJsonCount(5)
        ->assertJsonStructure([
            '*' => ['continent'],
        ]);
    }
}
