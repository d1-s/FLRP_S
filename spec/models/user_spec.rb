require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '全ての項目が入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが半角英数字6文字以上であれば登録できる' do
        @user.password = '12345a'
        @user.password_confirmation = '12345a'
        @user.valid?
        expect(@user).to be_valid
      end
      it 'profileが空でも登録できる' do
        @user.profile = ''
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nameが空だと登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームを入力してください')
      end
      it 'nameが41文字以上だと登録できない' do
        @user.name = 'a' * 41
        @user.valid?
        expect(@user.errors.full_messages).to include('ニックネームは40文字以内で入力してください')
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
      end
      it '重複したメールアドレスが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('メールアドレスはすでに登録されています')
      end
      it 'genderがを選択していないと登録できない' do
        @user.gender = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('性別を選択してください')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字それぞれ１文字以上含む６文字以上が必要です')
      end
      it 'passwordが英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字それぞれ１文字以上含む６文字以上が必要です')
      end
      it 'passwordが数字のみだと登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字それぞれ１文字以上含む６文字以上が必要です')
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは半角英数字それぞれ１文字以上含む６文字以上が必要です')
      end
      it 'passwordとpassword_confirmationが不一致だと登録できない' do
        @user.password = '123456a'
        @user.password_confirmation = '654321a'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード(確認)とパスワードの入力が一致しません')
      end
    end
  end
end
