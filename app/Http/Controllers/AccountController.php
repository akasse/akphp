<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;

class AccountController extends Controller
{
    //

    
    public function __construct()
    {
        $this->middleware('jwt.auth');
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    public function index()
    {
        $user = JWTAuth::toUser();

        return response([
                'status' => 'success',
                'data' => $user
        ]);
    }
}
