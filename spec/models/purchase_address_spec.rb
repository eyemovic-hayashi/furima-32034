require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '商品購入の登録' do
    before do
      @purchase_address = FactoryBot.build(:purchase_address)
    end

    context '商品購入の登録に成功するとき' do
      it '全ての値が正しく入力されていれば商品購入の登録ができる' do
        expect(@purchase_address).to be_valid
      end
      it 'building_nameが空でも商品購入の登録ができる' do
        @purchase_address.building_name = nil
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入の登録に失敗するとき' do
      it 'tokenが空だと商品購入の登録ができない' do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_numberが空だと商品購入の登録ができない' do
        @purchase_address.post_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post number can't be blank")
      end
      it 'post_numberが半角のハイフンを含んでいないと商品購入の登録ができない' do
        @purchase_address.post_number = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post number Input correctly')
      end
      it 'from_area_idを選択していないと商品購入の登録ができない' do
        @purchase_address.from_area_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('From area Select')
      end
      it 'municipalitiesが空だと商品購入の登録ができない' do
        @purchase_address.municipalities = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'address_numberが空だと商品購入の登録ができない' do
        @purchase_address.address_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Address number can't be blank")
      end
      it 'phone_numberが空だと商品購入の登録ができない' do
        @purchase_address.phone_number = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが全角数字だと商品購入の登録ができない' do
        @purchase_address.phone_number = '０９０１２３４５６７８'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberが12桁以上だと商品購入の登録ができない' do
        @purchase_address.phone_number = '090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
      it 'phone_numberにハイフン(-)が含まれていると商品購入の登録ができない' do
        @purchase_address.phone_number = '090-1234-5678'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
