class ChangeShiftDeskToDeskId < ActiveRecord::Migration
  def change
  	remove_column :shifts, :desk
  	add_column :shifts, :desk_id, :integer
  end
end
