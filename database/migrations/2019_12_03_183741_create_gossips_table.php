<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGossipsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('gossips', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('from_user_id');
            $table->integer('to_user_id');
            $table->string('message');
            $table->json('likes');
            $table->json('dislikes');
            $table->integer('score')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('gossips');
    }
}
