# **アプリ概要**

### **FLRP＆S**
![FLRP_S](https://user-images.githubusercontent.com/89243444/136727993-844f4027-2a99-46e5-b4c3-f667834facce.png)

### 飲食店特化の投稿＆検索アプリ
&emsp; ログインユーザーは投稿とコメントができる  
&emsp; マイページ内検索機能で自身のログとしての活用も可能  
&emsp; 未ログインユーザーも飲食店の検索アプリとして利用が可能  

# **使用技術**

### バックエンド
&emsp; Ruby , Ruby on Rails
### フロントエンド
&emsp; HTML , CSS , JavaScript , jQuery , Ajax
### データベース
&emsp; MySQL, ,Sequel Pro
### インフラ
&emsp; AWS(EC2, S3) , Capistrano
### WEBサーバー（本番環境）
&emsp; nginX
### アプリケーションサーバー（本番環境）
&emsp; unicorn
### ソース管理
&emsp; GitHub , GitHub Desktop
### テスト
&emsp; RSpec
### エディタ
&emsp; VSCode

# **本番環境**

### http://35.76.65.205/

### ログイン情報（テストユーザー）
- メールアドレス： test@com
- パスワード： test1111

### 利用方法
- 未ログインユーザーでも投稿の絞り込み検索ができます
- 投稿詳細ページ（コメント含む）・ユーザーマイページの閲覧が可能です
- ログインすると投稿とコメントができます
- 自身の投稿は投稿詳細ページから編集・削除ができます
- 自身の名前やプロフィールはマイページから編集できます
- 自身のマイページのみマイページ内での絞り込み検索が可能となります

# **実装した機能**

1. トップページ
    - 投稿一覧
    - 絞り込み検索機能
    - ページネーション機能  
    <img src="https://i.gyazo.com/fc744a6140dcacad28e570e95e79054e.gif" width="400">

    [![Image from Gyazo](https://i.gyazo.com/fc744a6140dcacad28e570e95e79054e.gif)](https://gyazo.com/fc744a6140dcacad28e570e95e79054e)  

1. 詳細ページ
    - 投稿詳細表示
    - コメント一覧  
    [![Image from Gyazo](https://i.gyazo.com/72dfd8ba919535e7f6b3d5276ed36f02.gif)](https://gyazo.com/72dfd8ba919535e7f6b3d5276ed36f02)  

    - 投稿編集機能（要ログイン）
    - 投稿削除機能（要ログイン）
    - コメント機能（要ログイン）  
    [![Image from Gyazo](https://i.gyazo.com/49ce79bedf240135b18851fd8fe94eed.gif)](https://gyazo.com/49ce79bedf240135b18851fd8fe94eed)  

1. ユーザー管理機能
    - 新規登録
    - ログイン
    - ログアウト  
    [![Image from Gyazo](https://i.gyazo.com/8379c248b225af0207b7a456c436d43f.jpg)](https://gyazo.com/8379c248b225af0207b7a456c436d43f)  

1. 新規投稿ページ
    - 投稿機能
    - 画像プレビュー表示
    - 画像複数枚投稿  
    [![Image from Gyazo](https://i.gyazo.com/9b2fbf0bedde0803706e99cff2e6acd1.gif)](https://gyazo.com/9b2fbf0bedde0803706e99cff2e6acd1)  

1. マイページ（要ログイン）
    - プロフィール表示
    - 該当ユーザーの投稿一覧
    - マイページ内絞り込み検索（ログインユーザー本人のみ）  
    [![Image from Gyazo](https://i.gyazo.com/34affcbccff7840f1abb92b0d72d0086.gif)](https://gyazo.com/34affcbccff7840f1abb92b0d72d0086)  

# **制作背景**

&emsp;1人でも気軽に行けるお店。急に幹事を任された。など様々なシチュエーションに対し、ピンポイントで絞り込み検索をしたいという課題解決をテーマに制作しました。また投稿者も、前に行ったお店は何ていうな前だったかな。今度遠方から友人が訪ねてくるけど、先日行ったお店に一緒に行きたいな。のような時にさっとマイページ内で検索ができれば便利なログとして利用できるます。  
&emsp;以上のように、閲覧者はシチュエーションごとの簡単検索ができる。投稿者も自身のログとして使用。または、皆におすすめを紹介したい！のような理由で気軽に投稿できるアプリにしようと思い制作しました。

## **・工夫した点**
&emsp;通常の投稿アプリという機能だけにならないよう、マイページ内での検索を可能とすることで投稿＆検索アプリと自分自身のログとしての機能を両立させるように制作しました。

## **・課題や今後実装したい機能**
&emsp;投稿時にお店に対する投稿者の評価★や、自由コメント欄に＃タグ付けができる機能を実装し、それぞれでも検索できる機能を実装したいと考えています。また、ユーザーフォロー機能を実装することでユーザー同士のコミュニケーションもより活発にしたい思っています。  
&emsp;これらの機能を実装し、運用していけるスキルをいち早く身につけ実装にしていくことが課題となっております

# ER図
![flrp_s_ER](https://user-images.githubusercontent.com/89243444/136750869-d7b785f1-ede4-4163-a893-d7766c618c90.png)