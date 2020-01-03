<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class GossipChat extends Model
{
    protected $fillable = [
        'user_id',
        'gossip_id',
        'message',
    ];
}
