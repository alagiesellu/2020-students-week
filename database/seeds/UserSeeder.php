<?php

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        for ($i = 0; $i < 39; $i++)
            \App\User::create([
                'name' => 'Male '.$i,
                'username' => 'm'.$i,
                'gender' => 'm',
                'password' => \Illuminate\Support\Facades\Hash::make('password'),
            ]);
        for ($i = 0; $i < 60; $i++)
            \App\User::create([
                'name' => 'Female '.$i,
                'username' => 'f'.$i,
                'gender' => 'f',
                'password' => \Illuminate\Support\Facades\Hash::make('password'),
            ]);

        \App\User::create([
            'name' => 'Admin',
            'username' => '2020',
            'gender' => 'm',
            'password' => \Illuminate\Support\Facades\Hash::make('password'),
            'is_admin' => 1,
        ]);
    }
}
