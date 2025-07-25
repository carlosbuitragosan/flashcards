<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Models\Deck;

class DeckController extends Controller
{
    public function index(): JsonResponse
    {
        try {
            $decks = Deck::all();
            return response()->json($decks);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function flashcards($deckId): JsonResponse
    {
        try {
            $deck = Deck::with('flashcards')->find($deckId);
            return response()->json($deck->flashcards);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
