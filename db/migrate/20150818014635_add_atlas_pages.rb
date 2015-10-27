class AddAtlasPages < ActiveRecord::Migration
  def change
    create_table :atlas_pages do |t|
      t.integer :atlas_id
      t.string :name
      t.text :description
      t.boolean :public

      t.timestamps null: false
    end
  end
end
