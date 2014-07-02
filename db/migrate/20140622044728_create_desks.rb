class CreateDesks < ActiveRecord::Migration
  def change
    create_table :desks do |t|
      t.string :name
      t.boolean :open
      t.datetime :close_date

      t.timestamps
    end
  end
end
