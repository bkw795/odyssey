class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :username
      t.string   :display_name
      t.string   :email

      t.timestamps null:  false
    end
  end
end
