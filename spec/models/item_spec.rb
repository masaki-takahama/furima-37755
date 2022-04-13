require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '商品名、商品説明、価格、カテゴリー、商品状態、配送料、発送地、発送日が全て入力されており、画像も添付され、且つユーザーが紐づいていれば、出品できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '商品名が空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it '商品説明が空では登録できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Explanation can't be blank"
      end
      it '価格が空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 半角数字で記入してください')
      end
      it '価格が¥9,999,999より大きいと登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 範囲は¥300~¥9,999,999の間です')
      end
      it '価格が¥300未満では登録できない' do
        @item.price = '290'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 範囲は¥300~¥9,999,999の間です')
      end
      it '価格半角数字でなければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 範囲は¥300~¥9,999,999の間です')
      end
      it '価格に小数点以下の数字は含めない' do
        @item.price = '1000.5'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price 範囲は¥300~¥9,999,999の間です')
      end
      it '画像が添付されてないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Image 画像が必要です')
      end

      it 'カテゴリーを選択していないと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品状態を選択していないと登録できない' do
        @item.product_status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status can't be blank")
      end
      it '配送料を選択していないと登録できない' do
        @item.delivery_charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end
      it '発送地を選択していないと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '発送日を選択していないと登録できない' do
        @item.shipping_date_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it 'ユーザーが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
