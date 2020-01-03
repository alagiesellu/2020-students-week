<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Gossip extends Model
{
    protected $fillable = [
        'from_user_id',
        'to_user_id',
        'message'
    ];
}
