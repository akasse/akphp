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
/*
Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/

//===========Authentification============

Route::apiResource('/users','UserController',
[ 'only' => ['show', 'index'],
'middleware' => 'jwt.auth' ]);

Route::post('/usersroles',[
    'as' => 'userroles',
    'uses' => 'UserController@attachUserRole',
    'middleware' => 'jwt.auth'
   ]);

Route::post('/permissions/add','UserController@attachPermissionak');
Route::get('/users/{user_id}/roles','UserController@getUserRole');
Route::get('/roles/{roleParam}','UserController@getPermissions');


Route::get('/account',[
    'as' => 'account',
    'uses' => 'AccountController@index',
    'middleware' => 'jwt.auth',
]);


//  ========Authentification=====
Route::group(['prefix' => 'auth','middleware' => 'jwt.auth'], function(){

	Route::get('/profil',[
        'as' => 'auth.profil',
        'uses' => 'AuthController@currentUser'
    ]);

    Route::get('/refresh',[
        'as' => 'auth.refresh',
        'uses' => 'AuthController@refresh'
    ]);

    Route::get('/invalide',[
        'as' => 'auth.invalide',
        'uses' => 'AuthController@deletetoken'
    ]);

  });