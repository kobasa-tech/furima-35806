require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できるとき' do
      it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、
        配送料の負担、発送元の地域、発送までの日数、販売価格が正しく入力されていれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品できないとき' do
      it '商品画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank") 
      end

      it '商品名が空では出品できない' do 
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの選択をしなければ出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態を選択しなければ出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item status can't be blank")
      end

      it '配送料の負担を選択しなければ出品できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it '発送元の地域を選択しなければ出品できない' do
        @item.province_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Province can't be blank")
      end

      it '発送までの日数を選択しなければ出品できない' do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery days can't be blank")
      end

      it '価格が¥300より安いと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が¥9,999,999より高いと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数字を入力しないと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end
end
