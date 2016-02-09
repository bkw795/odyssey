class CreatePublicTips < ActiveRecord::Migration
  def change
    create_table :public_tips do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :tip_text
    end
  end
end
