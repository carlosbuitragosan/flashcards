<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\FlashcardController;
use App\Http\Controllers\Api\DeckController;

Route::get('/flashcards', [FlashcardController::class, 'index']);
Route::get('/decks', [DeckController::class, 'index']);
