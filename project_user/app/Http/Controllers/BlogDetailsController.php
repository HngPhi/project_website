<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BlogDetailsController extends Controller
{
    //
    function show(){
        return view('user/blogdetails');
    }
}
