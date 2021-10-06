require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿' do
    context '投稿できるとき' do
      it '全ての項目が入力されていれば投稿できる' do
        expect(@post).to be_valid
      end
      it 'buidingが空でも登録できる' do
        @post.buiding = ''
        expect(@post).to be_valid
      end
      it 'introductionが空でも登録できる' do
        @post.introduction = ''
        expect(@post).to be_valid
      end
    end

    context '投稿できないとき' do
      it 'restaurantが空では登録できない' do
        @post.restaurant = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('店名を入力してください')
      end
      it 'visitが空では登録できない' do
        @post.visit = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('来店日を入力してください')
      end
      it 'category_idを選択しないと登録できない' do
        @post.category_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('シチュエーションを選択してください')
      end
      it 'openが空では登録できない' do
        @post.open = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('開店時間を入力してください')
      end
      it 'closeが空では登録できない' do
        @post.close = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('閉店時間を入力してください')
      end
      it 'prefecture_idを選択しないと登録できない' do
        @post.prefecture_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('都道府県を選択してください')
      end
      it 'cityが空では登録できない' do
        @post.city = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('市町村を入力してください')
      end
      it 'addressが空では登録できない' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('番地を入力してください')
      end
      it 'budget_idを選択しないと登録できない' do
        @post.budget_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('予算を選択してください')
      end
      it 'imagesが選択されていないと登録できない' do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('画像を添付してください')
      end
      it 'userと紐づいていないと登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('アカウントを入力してください')
      end
    end
  end
end
