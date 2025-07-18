<?php

namespace App\Http\Controllers;

use App\Models\Flashcard;

class FlashcardController extends Controller
{
    public function random()
    {
        $card = Flashcard::inRandomOrder()->first(['country', 'capital', 'deck_id']);
        return response()->json($card);
    }
}
