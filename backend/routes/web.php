<?php

use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

// Route::any('{any}', function () {
//     Log::info('Laravel caught route: ' . request()->path());
//     return view('welcome');
// })->where('any', '.*');
