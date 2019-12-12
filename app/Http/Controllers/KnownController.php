<?php

namespace App\Http\Controllers;

use App\Message;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class KnownController extends Controller
{
    public function friend(Request $request)
    {
        $friend = $request->user()->user;

        abort_if(is_null($friend), 400, json_encode([['Friend not assigned yet.']]));

        return response()->json([
            'friend' => $friend,
        ]);
    }

    public function get_messages(Request $request)
    {
        $user_id = $request->user()->id;
        return response()->json([
            'messages' => Message::where('known_user_id', $user_id)->orderByDesc('id')->paginate()
        ]);
    }

    public function post_messages(Request $request)
    {
        $val = Validator::make($request->toArray(), [
           'message' => 'required|string|max:500',
        ]);

        abort_if($val->fails(), 400, json_encode($val->errors()));

        $user_id = $request->user()->id;
        Message::create([
            'message' => $request['message'],
            'known_user_id' => $user_id,
            'user_id' => $user_id,
        ]);
        return response()->json([
            'messages' => Message::where('known_user_id', $user_id)->orderByDesc('id')->paginate()
        ]);
    }
}
