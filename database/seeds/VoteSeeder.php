<?php

use Illuminate\Database\Seeder;

class VoteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Vote::create([
                'candidate_id' => 1,
                'count' => 20,
                'category' => 'beauty',
        ]);
        \App\Vote::create([
                'candidate_id' => 2,
                'count' => 10,
                'category' => 'beauty',
        ]);
    }
}
