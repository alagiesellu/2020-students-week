<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class GetterController extends Controller
{

    public function configs()
    {
        return response()->json([
            'groups' => config('more.groups'),
        ]);
    }
}
