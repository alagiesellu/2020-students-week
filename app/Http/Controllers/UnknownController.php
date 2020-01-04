<?php

namespace App\Http\Controllers;

use App\Message;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class UnknownController extends Controller
{
    public static function friend(Request $request)
    {
        return User::where('user_id', $request->user()->id)->first();
    }
    public function exists(Request $request)
    {
        return response()->json([
            'secret_friend_assigned' => $this->friend($request) != null
        ]);
    }

    public function get_messages(Request $request)
    {
        $friend = $this->friend($request);

        abort_if(is_null($friend), 400, json_encode([['Friend not assigned yet.']]));

        $user_id = $friend->id;
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

        $user_id = $this->friend($request)->id;

        Message::create([
            'message' => $request['message'],
            'known_user_id' => $user_id,
            'user_id' => $request->user()->id,
        ]);
        return response()->json([
            'messages' => Message::where('known_user_id', $user_id)->orderByDesc('id')->paginate()
        ]);
    }
}
