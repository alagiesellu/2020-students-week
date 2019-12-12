<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Message extends Model
{
    protected $fillable = [
        'message',
        'known_user_id',
        'user_id',
        'is_received',
    ];

    protected $casts = [
        'is_received' => 'array'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
