class AddAtlas < ActiveRecord::Migration
  def change
    create_table :atlases do |t|
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
