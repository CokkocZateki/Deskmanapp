class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :homedesk
      t.string :password
      t.string :accesslevel

      t.timestamps
    end
  end
end
