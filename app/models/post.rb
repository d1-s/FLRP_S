class Post < ApplicationRecord

  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :private
  belongs_to :reserved

end