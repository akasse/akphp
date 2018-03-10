<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Controllers\Controller;
use Tymon\JWTAuth\Facades\JWTAuth;
use Tymon\JWTAuth\Exceptions\JWTException;

use Illuminate\Support\Facades\Validator;


class AuthController extends Controller
{
    //*
    public function token(Request $request) { 
        $credentials = $request->only('email', 'password'); // grab credentials from the request
        
        $validator = Validator::make(
        $credentials, [
            'email' => 'required|email',
            'password' => 'required|string',
        ]);
        
        if ($validator->fails()) {
            # code...
            return response()->json([
                'error'=> 1,
                'message' => 'Validation failed',
                'message' => $validator->errors,
            ],422);
           
        }
        
        try {
            $token = JWTAuth::attempt($credentials);
            if (!$token) { // attempt to verify the credentials and create a token for the user
                return response()->json(
                    ['error' => 'invalid_credentials'], 401);
            }
        } catch (JWTException $e) {
            return response()->json(
                ['error' => 'could_not_create_token'], 500); // something went wrong whilst attempting to encode the token
        }

        return response()->json(
             ['token' =>  $token]);
    }

    public function user(Request $request)
    {
        $user = User::find(Auth::user()->id);
        return response([
                'status' => 'success',
                'data' => $user
            ]);
    }


    public function refresh()
    {
        $token = JWTAuth::getToken();
        
        try {

           $token = JWTAuth::refresh($token);
           return response()->json(
            ['token' => $token], 200);

        } catch (TokenExpiredException $e) {
            return response()->json(
                ['error' => 1,
            'message' => 'Tocken Expirer'], 200); // something went wrong whilst attempting to encode the token
        }


        return response([
                'status' => 'success'
            ]);
    }

    public function signup(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'password' => 'required'
        ]);

        $user = new User([
            'name' => $request->input('name'),
            'email' => $request->input('email'),
            'password' => bcrypt($request->input('password'))
        ]);

        $user->save();

        return response()->json([
            'message' => 'Successfully created user!'
            ],201);
    }
    
}