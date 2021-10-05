require 'rails_helper'

RSpec.describe "コメントする", type: :system do
  before do
    @post = FactoryBot.create(:post)
    @comment = FactoryBot.build(:comment)
  end

  context 'コメントができるとき' do
    it 'ログインしたユーザーはコメントできる' do
      #ログインする
      sign_in(@post.user)
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #投稿詳細ページにコメントができるフォームがあることを確認する
      expect(page).to have_selector '.comment-form'
      #フォームにコメントを入力する
      fill_in 'comment_text', with: @comment.text
      #コメントするボタンを押すと、Commentモデルのカウントが１上がることを確認する
      expect{
        find('input[class="comment-btn"]').click
      }.to change{ Comment.count }.by(1)
      #投稿詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq post_path(@post)
      #投稿詳細ページにコメントした内容が表示されていることを確認する
      expect(page).to have_content @comment.text
    end
  end
  context 'コメントができないとき' do
    it 'ログインしたユーザーも入力が正しくなければコメントできない' do
      #ログインする
      sign_in(@post.user)
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #投稿詳細ページにコメントができるフォームがあることを確認する
      expect(page).to have_selector '.comment-form'
      #フォームにコメントを入力する
      fill_in 'comment_text', with: ''
      #コメントするボタンを押しても、Commentモデルのカウントは上がらないことを確認する
      expect{
        find('input[class="comment-btn"]').click
      }.not_to change{ Comment.count }
      #投稿詳細ページにリダイレクトされることを確認する
      expect(current_path).to eq post_comments_path(@post)
    end
    it 'ログインしていなければコメントできない' do
      #トップページに移動する
      visit root_path
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #投稿詳細ページにコメントができるフォームがないことを確認する
      expect(page).to have_no_selector '.comment-form'
      #「コメント機能の利用はログインが必要です」が表示されていることを確認する
      expect(page).to have_content 'コメント機能の利用はログインが必要です'
    end
  end
end

RSpec.describe "コメントを削除する", type: :system do
  before do
    @user1 = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @post = FactoryBot.create(:post, user_id: @user1.id)
    @comment = FactoryBot.create(:comment, post_id: @post.id, user_id: @user1.id)
  end

  context 'コメントが削除できるとき' do
    it 'ログインしたユーザーは自分がしたコメントを削除することができる' do
      #ログインする
      sign_in(@user1)
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #すでにコメントされた内容が表示されていることを確認する
      expect(page).to have_content @comment.text
      #コメントを削除するボタンが表示されていないことを確認する
      expect(page).to have_selector '.comment-d-btn'
      #コメントを削除するとCommentモデルのレコードが１減ることを確認する
      find('.comment-d-btn').click
      expect{
        expect(page.accept_confirm).to eq "【確認】コメントを削除しますか？"
        sleep 0.5
      }.to change{ Comment.count }.by(-1)
      #投稿詳細ページに削除したコメントが表示されていないことを確認する
      expect(page).to have_no_content @comment.text
    end
  end
  context 'コメントが削除できないとき' do
    it 'ログインしたユーザーも自分以外がコメントしたものは削除できない' do
      #ログインする
      sign_in(@user2)
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #すでにコメントされた内容が表示されていることを確認する
      expect(page).to have_content @comment.text
      #コメントを削除するボタンが表示されていないことを確認する
      expect(page).to have_no_selector '.comment-d-btn'
    end
    it 'ログインしていなければコメントを削除するボタンが表示されない' do
      #トップページに移動する
      visit root_path
      #投稿の詳細ページ移動する
      visit post_path(@post)
      #すでにコメントされた内容が表示されていることを確認する
      expect(page).to have_content @comment.text
      #コメントを削除するボタンが表示されていないことを確認する
      expect(page).to have_no_selector '.comment-d-btn'
    end
  end
end