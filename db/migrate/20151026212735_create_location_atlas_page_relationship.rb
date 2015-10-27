class CreateLocationAtlasPageRelationship < ActiveRecord::Migration
  def change
    create_table :location_atlas_page_relationships do |t|
      t.integer :location_id
      t.integer :atlas_page_id
    end
  end
end
