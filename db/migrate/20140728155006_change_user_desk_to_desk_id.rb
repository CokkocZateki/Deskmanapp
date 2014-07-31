class ChangeUserDeskToDeskId < ActiveRecord::Migration
  def change
  	remove_column :users, :desk
  	add_column :users, :desk_id, :integer
  end
end
