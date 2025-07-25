<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Flashcard;
use Illuminate\Http\JsonResponse;

class FlashcardController extends Controller
{
    public function index(): JsonResponse
    {
        try {
            $cards = Flashcard::all();
            return response()->json($cards);
        } catch (\Exception $e) {
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
