<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Deck extends Model
{
    use HasFactory;
    protected $fillable = ['continent'];
}
