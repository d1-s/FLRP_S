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

### **1. トップページ**
  - 投稿一覧
  - 絞り込み検索機能
  - ページネーション機能  
  <p align="center">
    <a href="https://gyazo.com/ff66136e6688f2cff0e71e28c5660910"><img src="https://i.gyazo.com/ff66136e6688f2cff0e71e28c5660910.jpg" alt="Image from Gyazo" width="380"/></a> &emsp;
    <a href="https://gyazo.com/d2971f46737c87decf92411cec8820ca"><img src="https://i.gyazo.com/d2971f46737c87decf92411cec8820ca.jpg" alt="Image from Gyazo" width="380"/></a>
  </p>

### **2. 詳細ページ**
  - 投稿詳細表示
  - コメント一覧 
  - 投稿編集機能（要ログイン）
  - 投稿削除機能（要ログイン）
  - コメント機能（要ログイン）  
  <p align="center">
    <a href="https://gyazo.com/57e6475d7394d507f730ad78eaea9c6e"><img src="https://i.gyazo.com/57e6475d7394d507f730ad78eaea9c6e.jpg" alt="Image from Gyazo" width="380"/></a> &emsp;
    <a href="https://gyazo.com/fdc65a18c9f09f22431b3da5fee02a5c"><img src="https://i.gyazo.com/fdc65a18c9f09f22431b3da5fee02a5c.jpg" alt="Image from Gyazo" width="380"/></a>
  </p>

### **3. ユーザー管理機能**
  - 新規登録
  - ログイン
  - ログアウト  
  <p align="center">
    <a href="https://gyazo.com/4fa89e810a2aac11c54c9e9af0dbcdf8"><img src="https://i.gyazo.com/4fa89e810a2aac11c54c9e9af0dbcdf8.jpg" alt="Image from Gyazo" width="151"/></a> &emsp;
    <a href="https://gyazo.com/653c4d0431cccd72be66a8fc1eec9cb1"><img src="https://i.gyazo.com/653c4d0431cccd72be66a8fc1eec9cb1.jpg" alt="Image from Gyazo" width="350"/></a> &emsp;
    <a href="https://gyazo.com/454681ea6aa2160c5437ff1c01452b77"><img src="https://i.gyazo.com/454681ea6aa2160c5437ff1c01452b77.jpg" alt="Image from Gyazo" width="137"/></a>
  </p>

### **4. 新規投稿ページ**
  - 投稿機能
  - 画像プレビュー表示
  - 画像複数枚投稿  
  <p align="center">
    <a href="https://gyazo.com/67a4b9fdd075fe76a5c2b828284aa267"><img src="https://i.gyazo.com/67a4b9fdd075fe76a5c2b828284aa267.jpg" alt="Image from Gyazo" width="380"/></a> &emsp;
    <a href="https://gyazo.com/0f8aa04342f193ac9e91ed91090b620b"><img src="https://i.gyazo.com/0f8aa04342f193ac9e91ed91090b620b.jpg" alt="Image from Gyazo" width="380"/></a>
  </p>

### **5. マイページ（要ログイン）**
  - プロフィール表示
  - 該当ユーザーの投稿一覧
  - マイページ内絞り込み検索（ログインユーザー本人のみ）  
  <p align="center">
    <a href="https://gyazo.com/3770fe2fc2b4bcc7c2d828b050150fb4"><img src="https://i.gyazo.com/3770fe2fc2b4bcc7c2d828b050150fb4.jpg" alt="Image from Gyazo" width="380"/></a> &emsp;
    <a href="https://gyazo.com/05a4c2488d6c78f2ce63500eb6094171"><img src="https://i.gyazo.com/05a4c2488d6c78f2ce63500eb6094171.jpg" alt="Image from Gyazo" width="380"/></a>
  </p>

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