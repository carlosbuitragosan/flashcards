<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\FlashcardController;

Route::get('/flashcards', [FlashcardController::class, 'index']);
