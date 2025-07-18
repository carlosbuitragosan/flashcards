<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FlashcardController;

Route::get('/random-card', [FlashcardController::class, 'random']);
