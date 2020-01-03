<?php

namespace App\Http\Controllers;

use App\Gossip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class GossipController extends Controller
{
    public function gossip(Request $request)
    {
        $user = $request->user();


        abort_if(
            $user->id == $request['user'],
            400,
            json_encode([
                ['You cannot gossip yourself.']
            ])
        );

        $gossip = Gossip::where([
            ['from_user_id', $user->id],
            ['to_user_id', $request['user']],
        ])->first();

        abort_if(
            $gossip != null,
            400,
            json_encode([
                ['You already gossip this person.']
            ])
        );

        Gossip::create([
            'from_user_id' => $user->id,
            'to_user_id' => $request['user'],
            'message' => $request['message'],
            'likes' => [],
            'dislikes' => [],
        ]);

        return response()->json([
            'success' => 'Gossip successful.'
        ]);
    }
    public function index()
    {
        return response()->json([
            'gossips' => Gossip::with('to_user')
                ->orderBy('score', 'desc')
                ->paginate()
        ]);
    }
    public function delete(Request $request, $id)
    {
        $gossip = Gossip::find($id);
        $user = $request->user();

        abort_if(
            $gossip->from_user_id != $user->id,
            400,
            json_encode([
                ['Gossip not posted by you.']
            ])
        );

        $gossip->delete();



        return response()->json([
            'success' => 'Gossip successfully deleted.'
        ]);
    }
    public function like(Request $request, $id)
    {
        $gossip = Gossip::find($id);
        $user = $request->user();

        abort_if(
            array_search($user->id, $gossip->likes) !== false,
            400,
            json_encode([
                ['Gossip already liked.']
            ])
        );

        $likes = $gossip->likes;
        array_push(
            $likes,
            $user->id
        );

        $gossip->likes = $likes;
        $gossip->score += 1;

        $gossip->dislikes = array_diff($gossip->dislikes, [$user->id]);

        $gossip->save();

        return response()->json([
            'success' => 'Gossip successfully liked.'
        ]);
    }
    public function dislike(Request $request, $id)
    {
        $gossip = Gossip::find($id);
        $user = $request->user();

        abort_if(
            array_search($user->id, $gossip->dislikes) !== false,
            400,
            json_encode([
                ['Gossip already disliked.']
            ])
        );

        $dislikes = $gossip->dislikes;
        array_push(
            $dislikes,
            $user->id
        );

        $gossip->dislikes = $dislikes;
        $gossip->score -= 1;

        $gossip->likes = array_diff($gossip->likes, [$user->id]);

        $gossip->save();

        return response()->json([
            'success' => 'Gossip successfully disliked.'
        ]);
    }
}
