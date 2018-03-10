<?php

use Illuminate\Database\Seeder;
use App\Permission;
class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $createPost = new Permission();
        $createPost->name         = 'create-invoice';
        $createPost->display_name = 'Create invoice'; // optional
        // Allow a user to...
        $createPost->description  = 'create new blog invoice'; // optional
        $createPost->save();
        
        $editUser = new Permission();
        $editUser->name         = 'edit-invoice';
        $editUser->display_name = 'Edit invoice'; // optional
        // Allow a user to...
        $editUser->description  = 'edit existing invoice'; // optional
        $editUser->save();

        $deleteUser = new Permission();
        $deleteUser->name         = 'delete-invoice';
        $deleteUser->display_name = 'delete invoice'; // optional
        // Allow a user to...
        $deleteUser->description  = 'delete existing invoice'; // optional
        $deleteUser->save();
    }
}
