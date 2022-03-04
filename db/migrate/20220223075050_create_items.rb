class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user,             null: false, foreign_key: true
      t.string     :item_name,        null: false
      t.integer    :item_price,       null: false
      t.integer    :category_id,      null: false
      t.integer    :detail_id,        null: false
      t.text       :description,      null: false
      t.integer    :shipping_cost_id, null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :day_to_ship_id,   null: false
      t.timestamps
    end
  end
end
