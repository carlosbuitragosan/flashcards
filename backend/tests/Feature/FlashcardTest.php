<?php

namespace Tests\Feature;

use App\Models\Flashcard;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class FlashcardTest extends TestCase
{
    use RefreshDatabase;

    public function test_it_returns_all_flashcards(): void
    {
        \App\Models\Flashcard::factory()->count(10)->create();
        $response = $this->getJson('/api/flashcards');
        $response
        ->assertOk()
        ->assertJsonCount(10)
        ->assertJsonStructure([
          '*' => ['country', 'capital', 'deck_id'],
        ]);
    }
}
