<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function user(Request $request)
    {
        return $request->user();
    }

    public function login(Request $request)
    {
        $user = User::where('username', $request['username'])->first();

        if (is_null($user) || !Hash::check($request['password'], $user->password))
            return response()->json([
                'errors' => [['Invalid credentials.']],
            ]);

        $scope = [];

        if ($user->is_admin)
            $scope = ['is_admin'];

        return $user->createToken('token', $scope)->accessToken;
    }
}
