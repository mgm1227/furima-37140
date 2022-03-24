class OrderHistory < ApplicationRecord
  belongs_to  :order

  #数字３桁、ハイフン、数字４桁の並びのみ
  # validates :postal_code, presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  #０以外の整数を許可
  # validates :prefecture, numericality: {other_than: 0, message: "can't be blank"}
  # validates :municipality, presence: true
  # validates :address, presence: true
  # validates :building_name
  # validates :phone_number, presence: true, format:{with:}
end
