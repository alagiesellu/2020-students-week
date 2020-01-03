<?php

namespace App\Http\Controllers;

use App\User;
use App\Vote;
use App\VoteLog;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class VoteController extends Controller
{
    public function vote(Request $request)
    {
        $val = Validator::make($request->all(), [
            'user' => 'required|exists:users,id',
            'category' => 'required|in:'.implode(',', array_keys(config('more.vote_categories'))),
        ]);

        $user = $request->user();

        abort_if($val->fails(), 400, json_encode($val->errors()));

        abort_if($user->id == $request['user'], 400, json_encode([['You cannot vote for yourself.']]));

        $vote_log = VoteLog::where([
            ['user_id', $user->id],
            ['category', $request['category']]
        ])->first();

        abort_if($vote_log != null, 400, json_encode([
            ['You have already voted under this category']
        ]));

        VoteLog::create([
            'candidate_id' => $request['user'],
            'user_id' => $user->id,
            'category' => $request['category'],
        ]);

        $vote = Vote::where([
            ['candidate_id', $request['user']],
            ['category', $request['category']]
        ])->first();

        if (is_null($vote))
            Vote::create([
                'candidate_id' => $request['user'],
                'count' => 1,
                'category' => $request['category'],
            ]);
        else
            $vote->increment('count');

        return response()->json([
            'success' => 'Vote successful.'
        ]);
    }

    public function category($id)
    {
        return response()->json([
            'votes' => Vote::where('category', $id)->orderBy('count', 'desc')->with('candidate')->paginate(),
        ]);
    }

    public function categories()
    {
        return response()->json([
            'categories' => config('more.vote_categories')
        ]);
    }
}
