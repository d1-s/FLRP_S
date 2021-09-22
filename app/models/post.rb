class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :compartment
  belongs_to :reserved

  def self.ransackable_attributes(*)
    %w[category_id compartment_id reserved_id budget_id]
  end

  def self.ransackable_associations(*)
    %w[user category compartment reserved budget image]
  end
end
