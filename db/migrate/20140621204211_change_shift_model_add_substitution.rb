class ChangeShiftModelAddSubstitution < ActiveRecord::Migration
  def change
  	add_column :shifts, :sub_needed, :boolean
  end
end
