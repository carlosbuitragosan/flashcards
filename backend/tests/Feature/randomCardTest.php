<?php

namespace Tests\Feature;

use App\Models\Flashcard;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class RandomCardTest extends TestCase
{
    use RefreshDatabase;

    public function test_random_card_endpoint_returns_valid_flashcard(): void
    {
        Flashcard::factory()->create();

        $response = $this->getJson('/api/random-card');
        $response->assertOk();
        $response->assertJsonStructure([
          'country',
          'capital',
          'deck_id',
        ]);
    }
}
