class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :hashed_password
      t.boolean :enabled, :default=>true, :null=>false
      t.text :profile
      t.datetime :last_login_at
      t.string :salt

      t.timestamps
    end
    add_index :users, :username
  end
  def self.down
     drop_table :users
  end
end
