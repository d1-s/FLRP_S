class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :compartment
  belongs_to :reserved
  belongs_to :prefecture

  def self.ransackable_attributes(*)
    %w[category_id compartment_id reserved_id prefecture_id budget_id]
  end

  def self.ransackable_associations(*)
    %w[user category compartment reserved prefecture budget image]
  end
end
