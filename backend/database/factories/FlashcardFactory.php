<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Deck;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Flashcard>
 */
class FlashcardFactory extends Factory
{
    public function definition(): array
    {
        return [
            'country' => $this->faker->country(),
            'capital' => $this->faker->city(),
            'deck_id' => Deck::factory(),
        ];
    }
}
