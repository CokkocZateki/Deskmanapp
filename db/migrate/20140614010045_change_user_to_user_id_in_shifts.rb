class ChangeUserToUserIdInShifts < ActiveRecord::Migration
  def change
  	remove_column :shifts, :user
  	add_column :shifts, :user_id, :integer
  end
end
