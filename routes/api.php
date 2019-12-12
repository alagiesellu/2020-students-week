<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('/login', 'AuthController@login');
Route::get('/get/configs', 'GetterController@configs');

Route::middleware('auth:api')->group(function () {

    Route::get('/user', 'AuthController@user');

    Route::get('/me', 'MeController@index');
    Route::post('/me/upload', 'MeController@upload');

    Route::get('/vote/categories', 'VoteController@categories');

    Route::get('/known', 'KnownController@friend');
    Route::get('/known/messages/get', 'KnownController@get_messages');
    Route::post('/known/messages/post', 'KnownController@post_messages');

    Route::get('/unknown/messages/get', 'UnknownController@get_messages');
    Route::post('/unknown/messages/post', 'UnknownController@post_messages');
});
