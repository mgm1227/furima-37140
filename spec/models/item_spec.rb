require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できる' do
      it '商品が出品登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない' do
      it '画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品説明が空では登録できない' do
        
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空では登録できない' do
        @item.detail_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is not a number")
      end
      it '配送料負担が空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is not a number")
      end
      it '発送元地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '価格が全角数字では登録できない' do
        @item.item_price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid. Input half-width characters")
      end
    end
  end

end
