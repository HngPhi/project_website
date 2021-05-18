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
Route::get('/home', 'HomeController@index')->name('home');

Auth::routes();

Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    \UniSharp\LaravelFilemanager\Lfm::routes();
});

Route::prefix("admin/")->namespace("Admin")->group(function(){
    Route::get('', "DashBoardController@index");

    Route::resources([
        'blog' => "BlogController",
        'blog_category'=> "BlogCategoryController",
        'product' => "ProductController",
        'product_category' => "ProductCategoryController",
        'product_collection' => "ProductCollectionController",
        'user' => "UserController",
    ]);
});