require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.2)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば商品購入できる' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも商品購入できること' do
        @order_address.building_name = ''
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと購入できないこと' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと購入できないこと' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefectureを選択していないと購入できないこと' do
        @order_address.prefecture_id = "1"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      
      it 'phone_numberが空だと購入できないこと' do
        @order_address.phone_number = ""
        @order_address.valid?

        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberが全角数字だと購入できないこと' do
        @order_address.phone_number = '０９０１１４１０８０６'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが10桁未満だと購入できない' do
        @order_address.phone_number = '485548'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
      end
      it 'phone_numberが11桁を超えると購入できない' do
        @order_address.phone_number = '01203333012077770129'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end


      it 'municipalitiesが未記入だと購入できないこと' do
        @order_address.municipalities = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'street_numberが未記入だと購入できないこと' do
        @order_address.street_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Street number can't be blank")
      end
      it 'userが紐付いていないと購入できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと購入できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end



