<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class VoteController extends Controller
{
    public function categories()
    {
        return response()->json([
            'categories' => config('more.vote_categories')
        ]);
    }
}
