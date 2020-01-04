<?php

namespace App\Http\Controllers;

use App\User;
use App\Vote;
use App\VoteLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class GroupController extends Controller
{

    public function everyone()
    {
        return response()->json([
            'users' => User::orderBy('name', 'asc')->with(['user','unknown_user'])->paginate(),
        ]);
    }

    public function search(Request $request)
    {
        return response()->json([
            'users' => User::where('name', 'LIKE', '%'.$request['input'].'%')->paginate()
        ]);
    }

    public function show($id)
    {
        return response()->json([
            'users' => User::where('group', $id)->orderBy('name', 'asc')->paginate(),
        ]);
    }

    public function index()
    {
        return response()->json([
            'groups' => config('more.groups')
        ]);
    }
}
