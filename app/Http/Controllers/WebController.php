<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class WebController extends Controller
{
    public function welcome()
    {
        return view('welcome');
    }
    public function vue_capture()
    {
        return view('vue_capture');
    }
}
