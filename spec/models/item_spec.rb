require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品ができるとき' do
      it 'image, item_name, explanation, category_id, status_id, delivery_fee_id, from_area_id, delivery_day_id, price, user_idがあれば商品出品に成功する' do
        expect(@item).to be_valid
      end
    end

    context '商品出品ができないとき' do
      it 'imageが空だと商品出品に失敗する' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'item_nameが空だと商品出品に失敗する' do
        @item.item_name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it 'explanationが空だと商品出品に失敗する' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end
      it 'category_idを選択していないと商品出品に失敗する' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end

      it 'category_idが空だと商品出品に失敗する' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'status_idを選択していないと商品出品に失敗する' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'status_idが空だと商品出品に失敗する' do
        @item.status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'delivery_fee_idを選択していないと商品出品に失敗する' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee Select')
      end
      it 'delivery_fee_idが空だと商品出品に失敗する' do
        @item.delivery_fee_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'from_area_idを選択していないと商品出品に失敗する' do
        @item.from_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('From area Select')
      end
      it 'from_area_idが空だと商品出品に失敗する' do
        @item.from_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("From area can't be blank")
      end
      it 'delivery_day_idを選択していないと商品出品に失敗する' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery day Select')
      end
      it 'delivery_day_idが空だと商品出品に失敗する' do
        @item.delivery_day_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day can't be blank")
      end
      it 'priceが空だと商品出品に失敗する' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300未満だと商品出品に失敗する' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999より大きいと商品出品に失敗する' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it '出品する商品に紐づくユーザーがいないとき商品出品に失敗する' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
