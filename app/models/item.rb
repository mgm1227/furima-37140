class Item < ApplicationRecord

  validates :item_name, presence: true
  validates :item_price, presence: true, format: { with:/\d[0-9]{3,7}\z/, message: 'is invalid. Input half-width characters' }
  validates :description, presence: true
  validates :image, presence: true

  belongs_to :user
  #has_one    :order
  has_one_attached :image

  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :category_id, numericality: { other_than: 1 }
  validates :detail_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_to_ship_id, numericality: { other_than: 1 }

  belongs_to :category
  belongs_to :detail
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :day_to_ship
end
