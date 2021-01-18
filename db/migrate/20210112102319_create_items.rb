class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :item_name    , null: false
      t.text       :text         , null: false
      t.integer    :category_id  , null: false
      t.integer    :state_id     , null: false
      t.integer    :delivery_id  , null: false
      t.integer    :area_id      , null: false
      t.integer    :day_id      ,  null: false
      t.string     :price        , null: false
      t.string     :user_id,       null: false
      t.timestamps
    end
  end
end
