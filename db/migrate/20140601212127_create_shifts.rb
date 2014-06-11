class CreateShifts < ActiveRecord::Migration
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :end
      t.string :desk
      t.string :user
      t.boolean :specialpay
      t.boolean :graveyardshift

      t.timestamps
    end
  end
end
