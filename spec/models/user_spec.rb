require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    # できる子
    context 'ユーザー新規登録ができるとき' do
      it 'nicknameが登録できるとき' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end

      it 'emailが登録できるとき' do
        @user.email = 'test@test.com'
        expect(@user).to be_valid
      end

      it 'passwordが登録できるとき' do
        @user.password  
        expect(@user).to be_valid
      end

      it 'password確認' do
        @user.password_confirmation
        expect(@user).to be_valid
      end

      it 'family_name_zenが登録できる' do
        @user.family_name_zen = '山'
        expect(@user).to be_valid
      end

      it 'first_name_zenが登録できる' do
        @user.first_name_zen = '田'
        expect(@user).to be_valid
      end

      it 'family_name_kanaが登録できる' do
        @user.family_name_kana = 'ヤマ'
        expect(@user).to be_valid
      end

      it 'first_name_kanaが登録で来る' do
        @user.first_name_kana = 'ダ'
        expect(@user).to be_valid
      end

      it '誕生日が登録できる' do
        @user.birthday = '19300101'
        expect(@user).to be_valid
      end
    end

    # できない
    context 'ユーザー登録が失敗するとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複した場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
       #binding.pry
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Email is invalid")     
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword（確認用）が不一致では登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが英数混合でないと登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'psswordが半角数字だけでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英数字以外のものだと登録できない' do
        @user.password = '123abcあいう'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'familyname zenが空では登録できない' do
        @user.family_name_zen = '' 
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Family name zen can't be blank")
      end
      it 'familyname zenが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.family_name_zen = 'kana'
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("Family name zen is invalid")
      end
      it 'firstname zenが空では登録できない' do
        @user.first_name_zen = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name zen can't be blank")
      end
      it 'firstname zenが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
        @user.first_name_zen = 'kana'
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("First name zen is invalid")
      end
      it 'familyname kanaが空では登録できない' do
        @user.family_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'familyname kanaが全角（カタカナ）でなければ登録できない' do
        @user.family_name_kana = 'あ愛ｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'firstname kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        #binding.pry
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'firstname kanaが全角（カタカナ）でなければ登録できない' do
        @user.first_name_kana = 'あ愛ｂ'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
