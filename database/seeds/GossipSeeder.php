<?php

use Illuminate\Database\Seeder;

class GossipSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        \App\Gossip::create([
            'from_user_id' => 2,
            'to_user_id' => 1,
            'message' => 'Top',
            'likes' => [1,2,3,4,5,6,7,8],
            'dislikes' => [],
            'score' => 8,
        ]);
        \App\Gossip::create([
            'from_user_id' => 1,
            'to_user_id' => 2,
            'message' => 'Less',
            'likes' => [1,2,3,4,5,6,7,8],
            'dislikes' => [9,10],
            'score' => 6,
        ]);
    }
}
