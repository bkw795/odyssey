class CreatePrivateNotes < ActiveRecord::Migration
  def change
    create_table :private_notes do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :text
    end
  end
end
