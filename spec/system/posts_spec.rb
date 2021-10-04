require 'rails_helper'

RSpec.describe '投稿する', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context 'ログインしているとき' do
    it '正しい情報が入力されていれば新規投稿できる' do
      #ログインする
      sign_in(@user)
      #トップページに新規投稿ページに遷移できるボタンがあることを確認する
      expect(page).to have_content('投稿する')
      #新規投稿画面に移動する
      visit new_post_path
      #正しい投稿内容を入力する
      fill_in 'post_restaurant', with: @post.restaurant
      fill_in 'post_visit', with: '002021-10-04'
      select 'カップルにおすすめ', from: 'post_category_id'
      select '個室なし', from: 'post_compartment_id'
      select '貸切 不可', from: 'post_reserved_id'
      fill_in 'post_open', with: @post.open
      fill_in 'post_close', with: @post.close
      select '東京都', from: 'post_prefecture_id'
      fill_in 'post_city', with: @post.city
      fill_in 'post_address', with: @post.address
      fill_in 'post_buiding', with: @post.buiding
      select '1,000円 ~ 3,000円', from: 'post_budget_id'
      image_path = Rails.root.join('app/assets/images/brick_1.jpg')  #添付する画像を定義する
      attach_file('post[images][]', image_path)                      #画像選択フォームに画像を添付する
      fill_in 'post_introduction', with: @post.introduction
      #投稿するを押すとPostモデルのカウントが１上がることを確認する
      expect{
        find('input[name="commit"]').click
      }.to change{ Post.count }.by(1)
      #トップページに遷移していることを確認する
      expect(current_path).to eq root_path
      #トップページには先ほど投稿した内容が表示されていることを確認する
      expect(page).to have_content(@post.restaurant)
      expect(page).to have_content('2021年10月04日(月)')
      expect(page).to have_content('カップルにおすすめ')
      expect(page).to have_content('個室なし')
      expect(page).to have_content('貸切 不可')
      expect(page).to have_content('東京都')
      expect(page).to have_content(@post.city)
      expect(page).to have_content(@post.address)
      expect(page).to have_content(@post.buiding)
      expect(page).to have_content('1,000円 ~ 3,000円')
      expect(page).to have_selector('img')
    end
    it '入力情報が正しくなければ新規投稿できない' do
      #ログインする
      sign_in(@user)
      #トップページに新規投稿ページに遷移できるボタンがあることを確認する
      expect(page).to have_content('投稿する')
      #新規投稿画面に移動する
      visit new_post_path
      #正しい投稿内容を入力する
      fill_in 'post_restaurant', with: ''
      fill_in 'post_visit', with: ''
      select '---', from: 'post_category_id'
      select '個室なし', from: 'post_compartment_id'
      select '貸切 不可', from: 'post_reserved_id'
      fill_in 'post_open', with: ''
      fill_in 'post_close', with: ''
      select '---', from: 'post_prefecture_id'
      fill_in 'post_city', with: ''
      fill_in 'post_address', with: ''
      fill_in 'post_buiding', with: ''
      select '---', from: 'post_budget_id'
      fill_in 'post_introduction', with: ''
      #投稿するを押してもPostモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.not_to change{ Post.count }
      #新規投稿ページに戻されることを確認する
      expect(current_path).to eq posts_path
    end
  end
  context 'ログインしていないとき' do
    it 'ログインしていなければ新規投稿画面に遷移できない' do
      #トップページに移動する
      visit root_path
      #トップページに新規投稿ボタンが存在しないことを確認する
      expect(page).to have_no_content('新規投稿')
    end
  end
end
