<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Vote extends Model
{
    protected $fillable = [
        'candidate_id',
        'count',
        'category',
    ];

    protected $casts = [
//        'votes' => 'array',
    ];

    public function candidate()
    {
        return $this->belongsTo(User::class);
    }

    public function category()
    {
        return config('more.vote_categories')[$this->category];
    }
}
