class OrderOrderhistory
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_cord, :prefecture_id, :municipality, :address, :building_name, :phone_number 

  # ここにバリデーションの処理を書く
  with_option presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
    validates :municipality
    validates :address
    validates :phone_number, format: {with: /\A0\d{9,10}\z/ }
    validates :user_id
    validates :item_id
  end
  validates :building_name
  

  def save
    # 各テーブルにデータを保存する処理を書く
    order = Order.create(user_id: user_id, item_id: item_id)
    # 住所を保存する
    OrderHistory.create(post_cord: postal_code, prefecture: prefecture, municipality: municipality, address: address, phone_number: phone_number, building_name: building_name, order_id: order_id)
  end
end