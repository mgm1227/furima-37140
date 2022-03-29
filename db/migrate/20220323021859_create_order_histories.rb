class CreateOrderHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_histories do |t|
      t.string           :post_cord,      null: false
      t.integer          :prefecture_id,  null: false
      t.string           :municipality,   null: false
      t.string           :address,        null: false
      t.string           :building_name
      t.string           :phone_number,   null: false
      t.references       :order,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
