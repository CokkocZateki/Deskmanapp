class ChangeShiftStartAndEnd < ActiveRecord::Migration
  def change
  	remove_column :shifts, :start
  	remove_column :shifts, :end
  	add_column :shifts, :shift_start, :datetime
  	add_column :shifts, :shift_end, :datetime
  end
end
