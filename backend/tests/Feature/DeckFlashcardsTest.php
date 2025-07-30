<?php

namespace Tests\Feature;

use App\Models\Deck;
use App\Models\Flashcard;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class DeckFlashcardsTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_returns_flashcards_by_deck_id(): void
    {
        $deck = \App\Models\Deck::factory()->create();

        \App\Models\Flashcard::factory()->count(10)->create([
            'deck_id' => $deck->id,
        ]);
        $response = $this->getJson("/api/decks/{$deck->id}/flashcards");

        $response
        ->assertOk()
        ->assertJsonCount(10)
        ->assertJsonStructure([
          '*' => ['country', 'capital', 'deck_id' , 'flag', 'flag_alt'],
        ]);
    }
}
