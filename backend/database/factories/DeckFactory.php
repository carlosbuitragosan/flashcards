<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Deck>
 */
class DeckFactory extends Factory
{
    public function definition(): array
    {
        return [
            'continent' => $this->faker->randomElement([
                'Africa', 'Asia', 'Europe', 'Americas', 'Antarctic', 'Oceania',
            ])
        ];
    }
}
