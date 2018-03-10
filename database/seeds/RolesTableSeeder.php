<?php

use Illuminate\Database\Seeder;
use App\Role;
class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $owner = new Role();
        $owner->name         = 'owner';
        $owner->display_name = 'Project Owner'; // optional
        $owner->description  = 'User is the owner of a given project'; // optional
        $owner->save();
        
        $admin = new Role();
        $admin->name         = 'admin';
        $admin->display_name = 'User Administrator'; // optional
        $admin->description  = 'User is allowed to manage and edit other users'; // optional
        $admin->save();

        $staff = new Role();
        $staff->name         = 'staff';
        $staff->display_name = 'User Staff'; // optional
        $staff->description  = 'User staff is allowed to manage and edit other users'; // optional
        $staff->save();

        $simple = new Role();
        $simple->name         = 'simple';
        $simple->display_name = 'User simple'; // optional
        $simple->description  = 'User simple is allowed to manage and edit other users'; // optional
        $simple->save();
    }
}