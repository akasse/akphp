<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use JWTAuth;
use Entrust;

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

        if (!Entrust::can('AJOUTER')) {
            //return Redirect::to('/users');
        }

        return response([
                'status' => 'success',
                'data' => $user,
                'tres' => $user->roles
        ]);
    }
}
