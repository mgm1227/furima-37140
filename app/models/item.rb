class Item < ApplicationRecord

  belongs_to :user
  #has_one    :order
  has_one_attached :image

  extend ActiveHash: :Associations: :ActiveRecordExtensions
  belongs_to :category
  belongs_to :detail
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :day_to_ship

  validates :item_name, :item_price, :description, prefecture: true
  validates :category_id, :detail_id, :shipping_cost_id, :prefecture_id, :day_to_ship_id, numericality: { other_than: 1 }
  
end
