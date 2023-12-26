require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全ての項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      it 'メールアドレスが@を含む場合は登録できる' do
        @user.email = 'user@example.com'
        expect(@user).to be_valid
      end

      it 'パスワードが6文字以上であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end

      it 'パスワードが半角英数字混合であれば登録できる' do
        @user.password = 'aaa111'
        @user.password_confirmation = 'aaa111'
        expect(@user).to be_valid
      end

      it 'お名前(全角)が漢字・ひらがな・カタカナであれば登録できる' do
        @user.first_name = '山田'
        @user.last_name = '陸太郎'
        expect(@user).to be_valid
      end

      it 'お名前カナ(全角)がカタカナであれば登録できる' do
        @user.first_name_kana = 'ヤマダ'
        @user.last_name_kana = 'リクタ'
        expect(@user).to be_valid
      end

      it '生年月日が存在すれば登録できる' do
        @user.birthday = '1930-01-01'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'ニックネームが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'メールアドレスが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性である' do
        FactoryBot.create(:user, email: @user.email)
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスは@を含む必要がある' do
        @user.email = 'userexample.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは6文字以上であること' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'パスワードは半角英数字混合であること' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードとパスワード（確認用）が一致すること' do
        @user.password_confirmation = 'different'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)が空では登録できない' do
        @user.first_name = ''
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
      end

      it 'お名前(全角)は全角（漢字・ひらがな・カタカナ）であること' do
        @user.first_name = 'abc'
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid", "Last name is invalid")
      end

      it 'お名前カナ(全角)が空では登録できない' do
        @user.first_name_kana = ''
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank", "Last name kana can't be blank")
      end

      it 'お名前カナ(全角)は全角カタカナであること' do
        @user.first_name_kana = 'やまだ'
        @user.last_name_kana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid", "Last name kana is invalid")
      end

      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
