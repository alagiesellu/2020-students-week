<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class VoteLog extends Model
{
    protected $fillable = [
        'candidate_id',
        'user_id',
        'category',
    ];
}
