class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  VALID_PASSWORD = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  enum gender: { man: 0, woman: 1 }

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :gender, presence: { message: "を選択してください" }
  end
  validates :password, format: { with: VALID_PASSWORD, message: "は半角英数字それぞれ１文字以上含む6文字以上必要がです" }
end
