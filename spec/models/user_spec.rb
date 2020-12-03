require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '登録できるとき' do
      it '全て正しく入力できていると登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'ニックネームが空だと登録されない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空だと保存されない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailに＠がないと登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end


      it 'パスワードが空だと登録されない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードが５文字以下であれば登録ができない' do
        @user.password = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it 'パスワードとパスワード確認用の値が一致しないと登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'b1b1b1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'パスワードが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードが英字のみだと登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it 'パスワードが全角だと登録できない' do
        @user.password = 'ＡＡＡＡＡＡ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end

      it '名字が空だと登録されない' do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it '名前が空だと登録されない' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it '名字（フリガナ）が空だと登録されない' do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it '名前（フリガナ）が空だと登録されない' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it 'ユーザー本名は、全角（漢字・平仮名・カタカナ）での入力が必須であること' do
        @user.last_name = 'aaa'
        @user.first_name = 'bbb'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること' do
        @user.last_name_kana = 'あああ'
        @user.first_name_kana = 'いいい'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it '生年月日が空だと登録されない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
