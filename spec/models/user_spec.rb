require "rails_helper"

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、family_nameとfirst_name,family_name_kanaとfirst_name_kanaが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが6文字以下であれば登録できる' do
        @user.nickname = "aaaaaa"
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'family_nameが空では登録できない' do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'family_name_kanaが空では登録できない' do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birth_dayが空では登録できない' do
        @user.birth_day = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth day can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationが不一致では登録できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'password:半角英数混合(半角英語のみ)' do
        @user.password = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
      end
      it 'nicknameが7文字以上では登録できない' do
        @user.nickname = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
       @user.save
       another_user = FactoryBot.build(:user,email: @user.email)
       another_user.valid?
       expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が含まれてなければ登録できない' do
        @user.email = "kkkgmail.com"
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'family_nameが全角日本語でないと登録できないこと' do
        @user.family_name = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it 'first_nameが全角日本語でないと登録できないこと' do
        @user.first_name = "suzuki"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it 'family_name_kanaが全角カタカナでないと登録できないこと' do
        @user.family_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name kana is invalid")
      end
      it 'first_name_kanaが全角カタカナでないと登録できないこと' do
        @user.first_name_kana = "やまだ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end