<?php

namespace App\Http\Controllers;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Storage;

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

    public function load()
    {
        $count = 100;
        if ($file = fopen("storage/males", "r")) {
            while(!feof($file)) {
                $name = trim(preg_replace('/\s\s+/', '', fgets($file)));
                if ($name != '')
                    User::create([
                        'name' => $name,
                        'username' => $count++,
                        'gender' => 'm',
                        'password' => 'password',
                    ]);
            }
            fclose($file);
        }
        if ($file = fopen("storage/females", "r")) {
            while(!feof($file)) {
                $name = trim(preg_replace('/\s\s+/', '', fgets($file)));
                if ($name != '')
                    User::create([
                        'name' => $name,
                        'username' => $count++,
                        'gender' => 'f',
                        'password' => 'password',
                    ]);
            }
            fclose($file);
        }

//        dd($males);
//
//
//        $males = File::get('storage/males');
//        $females = File::get('storage/females');
//
//        $count = 100;
//
//        foreach(explode(',', $males) as $name) {
//            $name = trim(preg_replace('/\s\s+/', ' ', $name));
//            if ($name != '')
//                User::create([
//                    'name' => $name,
//                    'username' => $count++,
//                    'gender' => 'm',
//                    'password' => 'password',
//                ]);
//        }
//
//        foreach(explode(',', $females) as $name) {
//            $name = trim(preg_replace('/\s\s+/', ' ', $name));
//            if ($name != '')
//                User::create([
//                    'name' => $name,
//                    'username' => $count++,
//                    'gender' => 'f',
//                    'password' => 'password',
//                ]);
//        }

        return $this->cook();
    }

    public function cook()
    {
        $get = [
            'id',
            'name',
            'username',
            'user_id',
            'password',
            'group',
        ];
        $users = User::orderByDesc('gender')->get($get)->toArray();

        $first = $second = $first_ = $second_ = [];

        while (count($users))
        {
            array_push($first, array_pop($users));
            array_push($second, array_shift($users));
        }

        shuffle($first);
        shuffle($second);

        for ($i = 0; $i < count($first); $i++)
            $first[$i]['user_id'] = $second[$i]['id'];

        foreach ([1,2,3] as $item)
        {
            $push = array_shift($second);
            array_push($second, $push);
        }

        for ($i = 0; $i < count($second); $i++)
            $second[$i]['user_id'] = $first[$i]['id'];

        // compile
        $users = array_merge($first, $second);

        // distribute groups
        $groups = array_keys(config('more.groups'));
        $groups_ = $groups;

        $i = count($users) - 1;
        while ($i >= 0)
        {
            if (count($groups_) == 0) $groups_ = $groups;

            $users[$i]['group'] = array_pop($groups_);
            $i -= 1;
        }

        // assign password and store
        for ($i = 0; $i < count($users); $i++)
        {
            $password = rand(1000,9999);
            $users[$i]['visible_password'] = $password;
            $users[$i]['password'] = bcrypt($password);

            $user = User::find($users[$i]['id']);
            $user->update($users[$i]);
            $users[$i]['user'] = $user->user->name;
        }

        return view('cook', [
            'users' => $users,
            'groups' => config('more.groups'),
        ]);
    }
}
