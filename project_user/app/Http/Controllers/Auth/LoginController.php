<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers {
        logout as performLogout;
    }

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = RouteServiceProvider::HOME;

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }

    public function logout(Request $request)
    {
        $this->performLogout($request);
        return redirect()->route('login');
    }

    function login(Request $request){
        $remember = $request->has('remember') ? true : false;
        $request->validate(
            [
                'email' => 'required|email|max:255',
                'password' => 'required|min:8'
            ],
            [
                'required' => ":attribute không được để trống",
                'min' => ':attribute độ dài tối thiểu :min kí tự',
                'max' => ':attribute độ dài tối đa :max kí tự'
            ],
            [
                'password' => "Mật khẩu"
            ]
        );

        if(Auth::attempt(['email' => $request->email, 'password' => $request->password], $remember)){
            return redirect('/');
        }
        else{
            return redirect()->back()->with('status', 'Đăng nhập thất bại');
        }
    }
}
