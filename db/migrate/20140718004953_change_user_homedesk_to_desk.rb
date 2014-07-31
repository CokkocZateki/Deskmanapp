class ChangeUserHomedeskToDesk < ActiveRecord::Migration
  def change
  	remove_column :users, :homedesk
  	add_column :users, :desk, :string
  end
end
