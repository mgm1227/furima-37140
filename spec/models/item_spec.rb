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
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = 'id: 1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is not a number")
      end
      it '商品の状態が空では登録できない' do
        @item.detail_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is not a number")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.detail_id = 'id: 1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Detail is not a number")
      end
      it '配送料負担が空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is not a number")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @item.shipping_cost_id = 'id: 1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost is not a number")
      end
      it '発送元地域が空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @item.prefecture_id = 'id: 1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is not a number")
      end
      it '発送までの日数が空では登録できない' do
        @item.day_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship is not a number")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @item.day_to_ship_id = 'id: 1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship is not a number")
      end
      it '価格が空では出品できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格が300円未満は出品できない' do
        @item.item_price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格が9_999_999円を超えると出品できない' do
        @item.item_price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include()
      end
      it '価格が全角数字では登録できない' do
        @item.item_price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is invalid. Input half-width characters")
      end
      it 'ユーザーが紐づいていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end

end
