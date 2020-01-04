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
//Route::get('/load', 'WebController@load');
//Route::get('/cook', 'WebController@cook');

Route::middleware('auth:api')->group(function () {

    Route::get('/user', 'AuthController@user');

    Route::get('/me', 'MeController@index');
    Route::post('/me/upload', 'MeController@upload');
    Route::post('/me/edit', 'MeController@edit');

    Route::get('/vote/categories', 'VoteController@categories');
    Route::get('/vote/categories/{id}', 'VoteController@category');
    Route::post('/vote', 'VoteController@vote');

    Route::get('/group', 'GroupController@index');
    Route::get('/group/{id}', 'GroupController@show');

    Route::get('/everyone', 'GroupController@everyone');
    Route::post('/everyone/search', 'GroupController@search');

    Route::get('/known', 'KnownController@friend');
    Route::get('/known/messages/get', 'KnownController@get_messages');
    Route::post('/known/messages/post', 'KnownController@post_messages');

    Route::get('/unknown/messages/get', 'UnknownController@get_messages');
    Route::get('/unknown/exists', 'UnknownController@exists');
    Route::post('/unknown/messages/post', 'UnknownController@post_messages');

    Route::get('/gossips', 'GossipController@index');
    Route::post('/gossips', 'GossipController@gossip');
    Route::post('/gossips/delete/{id}', 'GossipController@delete');
    Route::post('/gossips/like/{id}', 'GossipController@like');
    Route::post('/gossips/dislike/{id}', 'GossipController@dislike');
});
