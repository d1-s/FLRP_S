require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  context 'コメントできるとき' do
    it 'textが空でなければコメントできる' do
      expect(@comment).to be_valid
    end
  end

  context 'コメントできないとき' do
    it 'textが空だとコメントできない' do
      @comment.text = ''
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Textを入力してください")
    end
    it 'userと紐づいていないとコメントできない' do
      @comment.user = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Userを入力してください")
    end
    it 'postと紐づいていないとコメントできない' do
      @comment.post = nil
      @comment.valid?
      expect(@comment.errors.full_messages).to include("Postを入力してください")
    end
  end
end
