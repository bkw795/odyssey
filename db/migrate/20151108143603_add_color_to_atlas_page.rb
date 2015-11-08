class AddColorToAtlasPage < ActiveRecord::Migration
  def change
    add_column :atlas_pages, :color_code, :string
  end
end
