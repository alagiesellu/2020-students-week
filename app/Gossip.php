<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Gossip extends Model
{
    protected $fillable = [
        'from_user_id',
        'to_user_id',
        'message',
        'likes',
        'dislikes',
        'score',
    ];

    protected $casts = [
        'likes' => 'array',
        'dislikes' => 'array',
    ];

    public function to_user()
    {
        return $this->belongsTo(User::class);
    }

    public function from_user()
    {
        return $this->belongsTo(User::class);
    }
}
