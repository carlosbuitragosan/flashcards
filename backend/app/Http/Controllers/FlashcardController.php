<?php

namespace App\Http\Controllers;

use App\Models\Flashcard;

class FlashcardController extends Controller
{
    public function random()
    {
        try {
            $card = Flashcard::inRandomOrder()->first(['country', 'capital', 'deck_id']);
            return $card
                ? response()->json($card)
                : response()->json(['error' => 'No flashcards found'], 404);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
