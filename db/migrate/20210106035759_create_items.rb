class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :text
      t.integer :category_id
      t.integer :state_id
      t.integer :price
      t.integer :delivery_id
      t.integer :area_id
      t.integer :days_id
      t.string :item_name
      t.references :user
      t.timestamps
    end
  end
end
