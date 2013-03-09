class CreateRolesUsersJoin < ActiveRecord::Migration
  def up
    create_table :roles_users, :id=>false do |t|
	t.integer :role_id, :null=>false
	t.integer :user_id, :null=>false
    end
  end

  def down
    drop_table :roles_users
  end
end
