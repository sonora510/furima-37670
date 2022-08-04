require 'rails_helper'

describe OrderAddressbook, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @order_addressbook = FactoryBot.build(:order_addressbook, user_id: @user.id, item_id: @item.id)
    sleep 0.1
  end

  # できる子
  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it '商品購入できる時' do
        expect(@order_addressbook).to be_valid
      end

      it '建物名が空でも保存ができる' do
        @order_addressbook.bilding_name = ''
        expect(@order_addressbook).to be_valid
      end
    end

    # できない子
    context '内容に問題がある時' do
      it 'tokenが空では登録できない' do
        @order_addressbook.token = nil
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Token can't be blank")
      end

      it '郵便番号が空では登録できない' do
        @order_addressbook.post_code = nil
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Post code Postnum can't be blank")
      end

      it '郵便番号にハイフンが含まれていない場合は登録できない' do
        @order_addressbook.post_code = '1234567'
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Post code Postnum can't be blank")
      end

      it '都道府県が未設定では登録できない' do
        @order_addressbook.prefecture_id = 1
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Prefecture Can't be blank")
      end

      it '市区町村が空白だと登録できない' do
        @order_addressbook.city = ''
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空白だと登録できない' do
        @order_addressbook.banti = ''
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Banti can't be blank")
      end

      it '電話番号が空白だと登録できない' do
        @order_addressbook.phone_num = ''
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Phone num can't be blank")
      end

      it '電話番号が12桁以上では登録できない' do
        @order_addressbook.phone_num = '090222233334'
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Phone num is invalid")
      end

      it '電話番号は数字のみでないと登録できない(英字不可）' do
        @order_addressbook.phone_num = '090abcd1234'
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Phone num is invalid")
      end

      it '電話番号は数字のみでないと登録できない（ハイフン不可）' do
        @order_addressbook.phone_num = '090-1111-2222'
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Phone num is invalid")
      end

      it '電話番号は全角文字では登録できない' do
        @order_addressbook.phone_num = 'アイウエオかきくけこ'
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Phone num is invalid")
      end

      it 'Userが紐づいていないと登録できない' do
        @order_addressbook.user_id = ''
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("User can't be blank")
      end

      it 'Itemが紐づいていないと登録できない' do
        @order_addressbook.item_id = ''
        @order_addressbook.valid?
        expect(@order_addressbook.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
