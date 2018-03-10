<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Role;
use App\Permission;

class UserController extends Controller
{
      /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        return User::with(['roles'=> function($requete){
            $requete -> select('name') ;
          }])->select('id','name','email')->get();
    }

     /**
     * Display the specified resource.
     *
     * @param  $roleParam
     * @return mixed
     */
    public function getPermissions($roleParam)
    {
     $role = Role::where('name',$roleParam)->first();
      //dd($role);
      return $role->perms;
        //return Role::where('name',$role);
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Model\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {
      // dd($user->roles());
        return response()->json([
            'error'=> 0,
            'data' =>   $user->roles
        ],200);
    }

    public function getUserRole($userId)
    {
      // dd($user->roles());
        //return User::find($userId)::with('roles')->get();

        return User::find($userId)->roles;
        
        //return User::find(3);
    }


    /**
     *Ajouté un role à un user
     *  
     * @param  \App\Model\User  $user
     * @return \Illuminate\Http\Response
     */
    public function attachUserRole(Request $req)
    {
        $param = $req->only('userId','role');
        $user = User::findOrFail($param['userId']);
        $roleId = Role::where('name',$param['role'])->get();
        
        $user->roles()->attach($roleId);

        return response()->json([
            'error'=> 0,
            'data' =>   $user  
        ],400);
    }

    //ajouté une permission à un role
    public function attachPermissionak(Request $req)
    {
        $param = $req->only('permission','role');
        
        //dd($param);

        $permission = Permission::where('name',$param['permission'])->first();
       
        $role = Role::where('name',$param['role'])->first();

       
         $role->attachPermission($permission);

        return response()->json([
            'error'=> 0,
            'data' =>  $role
        ],400);
       
        
       /*
        $user = User::findOrFail($param['userId']);
        
        $roleId = Role::where('role',$param['role']);

        $user->roles()->attach($roleId);

        return $user;
        */
    }

   
}
