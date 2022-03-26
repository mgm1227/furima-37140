require 'rails_helper'

RSpec.describe OrderOrderhistory, type: :model do
  describe '購入情報の保存' do
    before do
      @order_orderhistory = FactoryBot.build(:order_orderhistory)
    end

    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる事' do
        expect(@order_orderhistory).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @order_orderhistory.building_name = ''
        expect(@order_orderhistory).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_cordが空でだと保存できない' do
        @order_orderhistory.post_cord = ''
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include("Post cord can't be blank")
      end
      it 'post_cordが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_orderhistory.post_cord = '1234567'
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include('Post cord is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択しないと保存できない' do
        @order_orderhistory.prefecture_id = 0
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalityが空では保存できない' do
        @order_orderhistory.municipality = ''
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include("Municipality can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_orderhistory.address = ''
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_orderhistory.phone_number = ''
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include("Phone number can't be blank", "Phone number is invalid")
      end
      it 'phone_numberは、10桁以上11桁以内の半角数値でないと保存できない' do
        @order_orderhistory.phone_number = '0123456789012'
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include()
      end
      it 'phone_numberは、10桁以上11桁以内の全角数値では保存できない' do
        @order_orderhistory.phone_number = '０１２３４５６７８９０'
        @order_orderhistory.valid?
        expect(@order_orderhistory.errors.full_messages).to include()
      end
    end
  end
end