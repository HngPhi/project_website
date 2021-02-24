<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

Route::get("user/landingpage", "HomeController@show");
Route::get("user/shop", "ShopController@show");
Route::get("user/blog", "BlogController@show");
Route::get("user/contact", "ContactController@show");
Route::get("user/blogdetails", "BlogDetailsController@show");
