<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class MeController extends Controller
{
    public function index(Request $request)
    {
        return response()->json([
            'me' => $request->user(),
        ]);
    }

    public function edit(Request $request)
    {
        $user = $request->user();
        $user->update([
            'about' => $request['about']
        ]);
        return response()->json([
            'success' => 'About successfully updated.',
            'user' => $user,
        ]);
    }

    public function upload(Request $request)
    {
        $user = $request->user();

        $file_data = $request->input('pic');
        @list($type, $file_data) = explode(';', $file_data);
        $file_name = 'profiles/'.$user->id.'.'.explode('/', $type)[1]; //generating unique file name;
        @list(, $file_data) = explode(',', $file_data);

        if($file_data != ""){ // storing image in storage/app/public Folder
            Storage::put('public/'.$file_name, base64_decode($file_data));

            $user->update([
                'img' => $file_name
            ]);

            return response()->json([]);
        }
    }
}
