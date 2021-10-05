require 'rails_helper'

RSpec.describe '投稿する', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post)
  end

  context '新規投稿できるとき' do
    it 'ログインしたユーザーが正しい情報が入力すれば新規投稿できる' do
      #ログインする
      sign_in(@user)
      #トップページに新規投稿ページに遷移できるボタンがあることを確認する
      expect(page).to have_content('投稿する')
      #新規投稿画面に移動する
      visit new_post_path
      #正しい投稿内容を入力する
      fill_in 'post_restaurant', with: @post.restaurant
      fill_in 'post_visit', with: @post.visit
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
  end
  context '新規投稿できないとき' do
    it 'ログインしたユーザーでも入力情報が正しくなければ新規投稿できない' do
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
    it 'ログインしていなければ新規投稿画面に遷移できない' do
      #トップページに移動する
      visit root_path
      #トップページに新規投稿ボタンが存在しないことを確認する
      expect(page).to have_no_content('新規投稿')
    end
  end
end

RSpec.describe '投稿詳細', type: :system do
  before do
    @post = FactoryBot.create(:post)
  end

  it 'ログインしたユーザーは投稿詳細ページに遷移してコメントができるフォームが表示される' do
    #ログインする
    sign_in(@post.user)
    #投稿をクリックすると詳細ページ遷移することを確認する
    all('.post-list-wrapper')[0].click
    expect(current_path).to eq post_path(@post)
    #詳細ページに投稿内容が表示されていることを確認する
    expect(page).to have_content(@post.restaurant)
    expect(page).to have_content('2021年10月04日(月)')
    expect(page).to have_content('カップルにおすすめ')
    expect(page).to have_content('個室なし')
    expect(page).to have_content('貸切 不可')
    expect(page).to have_content('東京都')
    expect(page).to have_content(@post.city)
    expect(page).to have_content(@post.address)
    expect(page).to have_content(@post.buiding)
    expect(page).to have_content('10:00')
    expect(page).to have_content('19:00')
    expect(page).to have_content('1,000円 ~ 3,000円')
    expect(page).to have_selector('img')
    #詳細ページにコメントができるフォームがあることを確認する
    expect(page).to have_selector '.comment-form'
  end
  it 'ログインしていないユーザーは投稿詳細ページに遷移はできるが、コメントができるフォームは表示されない' do
    #トップページに移動する
    visit root_path
    #投稿をクリックすると詳細ページ遷移することを確認する
    all('.post-list-wrapper')[0].click
    expect(current_path).to eq post_path(@post)
    #詳細ページに投稿内容が表示されていることを確認する
    expect(page).to have_content(@post.restaurant)
    expect(page).to have_content('2021年10月04日(月)')
    expect(page).to have_content('カップルにおすすめ')
    expect(page).to have_content('個室なし')
    expect(page).to have_content('貸切 不可')
    expect(page).to have_content('東京都')
    expect(page).to have_content(@post.city)
    expect(page).to have_content(@post.address)
    expect(page).to have_content(@post.buiding)
    expect(page).to have_content('10:00')
    expect(page).to have_content('19:00')
    expect(page).to have_content('1,000円 ~ 3,000円')
    expect(page).to have_selector('img')
    #詳細ページにコメントができるフォームがないことを確認する
    expect(page).to have_no_selector '.comment-form'
    #「コメント機能の利用はログインが必要です」が表示されていることを確認する
    expect(page).to have_content 'コメント機能の利用はログインが必要です'
  end
end

RSpec.describe '投稿を編集', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context '投稿の編集ができるとき' do
    it 'ログインしたユーザーは自分が投稿した投稿を編集できる' do
      #「post1」を投稿したユーザーでログインする
      sign_in(@post1.user)
      #自分が投稿した投稿をクリックすると詳細ページに移動することを確認する
      all('.post-list-wrapper')[1].click
      expect(current_path).to eq post_path(@post1)
      #詳細ページに「編集」へのリンクがあることを確認する
      expect(page).to have_link '編集', href: edit_post_path(@post1)
      #投稿編集ページに移動する
      visit edit_post_path(@post1)
      #すでに投稿済みの内容がフォームに入っていることを確認する
      expect(
        find('#post_restaurant').value
      ).to eq(@post1.restaurant)
      expect(
        find('#post_visit').value
      ).to eq('2021-10-04')
      expect(
        find('#post_category_id').value
      ).to eq "#{@post1.category_id}"
      expect(
        find('#post_compartment_id').value
      ).to eq "#{@post1.compartment_id}"
      expect(
        find('#post_reserved_id').value
      ).to eq "#{@post1.reserved_id}"
      expect(
        find('#post_prefecture_id').value
      ).to eq "#{@post1.prefecture_id}"
      expect(
        find('#post_city').value
      ).to eq(@post1.city)
      expect(
        find('#post_address').value
      ).to eq(@post1.address)
      expect(
        find('#post_buiding').value
      ).to eq(@post1.buiding)
      expect(
        find('#post_budget_id').value
      ).to eq "#{@post1.budget_id}"
      expect(page).to have_selector('img')
      expect(
        find('#post_introduction').value
      ).to eq(@post1.introduction)
      #投稿を編集する
      fill_in 'post_restaurant', with: "#{@post1.restaurant}+編集した内容"
      fill_in 'post_visit', with: @post1.visit
      select '歓送迎会など大人数の飲み会も可', from: 'post_category_id'
      select '個室なし', from: 'post_compartment_id'
      select '貸切 不可', from: 'post_reserved_id'
      fill_in 'post_open', with: @post1.open
      fill_in 'post_close', with: @post1.close
      select '東京都', from: 'post_prefecture_id'
      fill_in 'post_city', with: "#{@post1.city}+編集した内容"
      fill_in 'post_address', with: "#{@post1.address}+編集した内容"
      fill_in 'post_buiding', with: "#{@post1.buiding}+編集した内容"
      select '3,000円 ~ 5,000円', from: 'post_budget_id'
      fill_in 'post_introduction', with: "#{@post1.introduction}+編集した内容"
      #編集するボタンを押してもPostモデルのカウントは上がらないことを確認する
      expect{
        find('input[name="commit"]').click
      }.not_to change{ Post.count }
      #詳細ページに遷移していることを確認する
      expect(current_path).to eq post_path(@post1)
      #詳細ページに編集した内容が表示されていることを確認する
      expect(page).to have_content "#{@post1.restaurant}+編集した内容"
      expect(page).to have_content('2021年10月04日(月)')
      expect(page).to have_content('歓送迎会など大人数の飲み会も可')
      expect(page).to have_content('個室なし')
      expect(page).to have_content('貸切 不可')
      expect(page).to have_content('東京都')
      expect(page).to have_content "#{@post1.city}+編集した内容"
      expect(page).to have_content "#{@post1.address}+編集した内容"
      expect(page).to have_content "#{@post1.buiding}+編集した内容"
      expect(page).to have_content('10:00')
      expect(page).to have_content('19:00')
      expect(page).to have_content('3,000円 ~ 5,000円')
      expect(page).to have_selector('img')
    end
  end
  context '投稿の編集ができないとき' do
    it 'ログインしたユーザーは自分以外のユーザーの投稿編集ページへは遷移できない' do
      #「post1」を投稿したユーザーでログインする
      sign_in(@post1.user)
      #「post2」の投稿をクリックして詳細ページに移動するを確認する
      all('.post-list-wrapper')[0].click
      expect(current_path).to eq post_path(@post2)
      #「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_post_path(@post2)
    end
    it 'ログインしていなければ、投稿編集ページに遷移できない' do
      #トップページに移動する
      visit root_path
      #「post1」の投稿詳細ページに移動する
      all('.post-list-wrapper')[1].click
      expect(current_path).to eq post_path(@post1)
      #「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_post_path(@post1)
      #トップページに移動する
      visit root_path
      #「post2」の投稿詳細ページに移動する
      all('.post-list-wrapper')[0].click
      expect(current_path).to eq post_path(@post2)
      #「編集」へのリンクがないことを確認する
      expect(page).to have_no_link '編集', href: edit_post_path(@post2)
    end
  end
end

RSpec.describe '投稿を削除', type: :system do
  before do
    @post1 = FactoryBot.create(:post)
    @post2 = FactoryBot.create(:post)
  end

  context '投稿を削除できるとき' do
    it 'ログインしたユーザーは自分の投稿を削除できる' do
      #「post1」を投稿したユーザーでログインする
      sign_in(@post1.user)
      #自分が投稿した投稿をクリックすると詳細ページに移動することを確認する
      all('.post-list-wrapper')[1].click
      expect(current_path).to eq post_path(@post1)
      #詳細ページに「削除」へのリンクがあることを確認する
      expect(page).to have_link '削除', href: post_path(@post1)
      #投稿を削除するとPostモデルのレコードが１減ることを確認する
      find('.delete-btn').click
      expect{
        expect(page.accept_confirm).to eq "【確認】この投稿を削除しますか？"
        sleep 0.5
      }.to change{ Post.count }.by(-1)
      #トップページに遷移していることを確認する
      expect(current_path).to eq root_path
      #トップページに「post1」の内容が存在しないことを確認する
      expect(page).to have_no_content(@post1.restaurant)
      expect(page).to have_no_content(@post1.city)
      expect(page).to have_no_content(@post1.address)
      expect(page).to have_no_content(@post1.buiding)
      # ↑ランダムで入力されているもののみ抜粋
    end
  end
  context '投稿を削除できないとき' do
    it 'ログインしたユーザーでも自分以外が投稿したものは削除できない' do
      #「post1」を投稿したユーザーでログインする
      sign_in(@post1.user)
      #「post2」の投稿をクリックすると詳細ページに移動することを確認する
      all('.post-list-wrapper')[0].click
      expect(current_path).to eq post_path(@post2)
      #詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: post_path(@post2)
    end
    it 'ログインしていなければ投稿の削除ボタンがない' do
      #トップページに移動する
      visit root_path
      #「post1」の投稿をクリックすると詳細ページに移動することを確認する
      all('.post-list-wrapper')[1].click
      expect(current_path).to eq post_path(@post1)
      #詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: post_path(@post1)
      #トップページに移動する
      visit root_path
      #「post2」の投稿をクリックすると詳細ページに移動することを確認する
      all('.post-list-wrapper')[0].click
      expect(current_path).to eq post_path(@post2)
      #詳細ページに「削除」へのリンクがないことを確認する
      expect(page).to have_no_link '削除', href: post_path(@post2)
    end
  end
end