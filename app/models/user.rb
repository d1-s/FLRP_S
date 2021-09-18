class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  enum sex: { man: 0, woman: 1}
  with_options presence: true do
    validates :name
    validates :gender
  end
  
end
