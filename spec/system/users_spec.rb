require 'rails_helper'

RSpec.describe 'アカウント新規登録', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'アカウント新規登録ができるとき' do
    it '正しい情報を入力すればアカウント新規登録ができ、トップページへ遷移する' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # アカウント情報を入力する
      fill_in 'user_name', with: @user.name
      fill_in 'user_email', with: @user.email
      choose 'user_gender_man' # 性別は男性を選択
      fill_in 'user_password', with: @user.password
      fill_in 'user_password_confirmation', with: @user.password_confirmation
      fill_in 'user_profile', with: @user.profile
      # アカウント登録ボタンを押すとユーザーモデルのカウントが１上がる
      expect  do
        find('input[name="commit"]').click
      end.to change { User.count }.by(1)
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # 新規登録ボタン、ログインボタンがないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # 新規投稿ボタン、マイページボタン、ログアウトボタンがあることを確認する
      expect(page).to have_content('投稿する')
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      # 登録したアカウント名がログインユーザーとして表示されていることを確認する
      expect(page).to have_content(@user.name)
    end
  end

  context 'アカウント新規登録ができないとき' do
    it '誤った情報ではアカウント新規登録ができず、新規登録ページへ戻ってくる' do
      # トップページに移動する
      visit root_path
      # トップページに新規登録へ遷移するボタンがあることを確認する
      expect(page).to have_content('新規登録')
      # 新規登録ページに移動する
      visit new_user_registration_path
      # アカウント情報を入力する
      fill_in 'user_name', with: ''
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      # アカウント登録ボタンを押してもユーザーモデルのカウントは上がらない
      expect  do
        find('input[name="commit"]').click
      end.not_to change { User.count }
      # 新規登録ページに戻されることを確認する
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ログイン', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ログインができるとき' do
    it '保存されているアカウント情報と合致すればログインができる' do
      # トップページに移動する
      visit root_path
      # トップページにログイン画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      # 正しいアカウント情報を入力する
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # トップページに遷移することを確認する
      expect(current_path).to eq root_path
      # 新規登録ボタン、ログインボタンがないことを確認する
      expect(page).to have_no_content('新規登録')
      expect(page).to have_no_content('ログイン')
      # 新規投稿ボタン、マイページボタン、ログアウトボタンがあることを確認する
      expect(page).to have_content('投稿する')
      expect(page).to have_content('マイページ')
      expect(page).to have_content('ログアウト')
      # 登録したアカウント名がログインユーザーとして表示されていることを確認する
      expect(page).to have_content(@user.name)
    end
  end

  context 'ログインができないとき' do
    it '保存されているアカウントと合致しなければログインできない' do
      # トップページに移動する
      visit root_path
      # トップページにログイン画面へ遷移するボタンがあることを確認する
      expect(page).to have_content('ログイン')
      # ログインページへ移動する
      visit new_user_session_path
      # アカウント情報を入力する
      fill_in 'user_email', with: 'shippai'
      fill_in 'user_password', with: 'miss'
      # ログインボタンをクリックする
      find('input[name="commit"]').click
      # ログインページに戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe 'アカウント情報の編集', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'アカウント情報の編集ができるとき' do
    # ログインする
    sign_in(@user)
    # トップページに、マイページに遷移するボタンがあることを確認する
    expect(page).to have_content('マイページ')
    # マイページに移動する
    visit user_path(@user)
    # マイページにアカウント情報の編集画面に遷移するボタンがあることを確認する
    expect(page).to have_content('編集')
    # アカウント情報の編集画面に移動する
    visit edit_user_registration_path(@user)
    # アカウント情報を入力する
    fill_in 'user_name', with: @user.name
    fill_in 'user_email', with: @user.email
    choose 'user_gender_man' # 性別は男性を選択
    fill_in 'user_profile', with: 'テストプロフィール'
    # 変更するボタンを押してもUserモデルのカウントは上がらない
    expect  do
      find('input[name="commit"]').click
    end.not_to change { User.count }
    # マイページに遷移することを確認する
    expect(current_path).to eq user_profile_path(@user)
    # 編集後の情報が表示されていることを確認する
    expect(page).to have_content('テストプロフィール')
  end
end
