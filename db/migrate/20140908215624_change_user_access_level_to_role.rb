class ChangeUserAccessLevelToRole < ActiveRecord::Migration
  def change
  	remove_column :users, :accesslevel
  	add_column :users, :role, :string

  end
end
