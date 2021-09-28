class Post < ApplicationRecord
  before_save :set_time_zone

  belongs_to :user
  has_one_attached :image
  has_many :comments, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :budget
  belongs_to :compartment
  belongs_to :reserved
  belongs_to :prefecture

  with_options presence: true do
    validates :city, :address, :open, :close, :compartment_id, :reserved_id
    validates :image, presence: { message: "を添付してください" }
    validates :restaurant, length: { maximum: 40 }
    validates :visit
    validates :category_id, :budget_id, :prefecture_id, presence: { message: "を選択してください" }
  end

  # new時のタイムゾーン対策(LMTになってしまい時間がズレるのを避ける)
  def set_time_zone
    year = self.visit.year
    month = self.visit.month
    day = self.visit.day

    self.open = self.open.change(year: year, month: month, day: day)
    self.close = self.close.change(year: year, month: month, day: day)
  end

  def self.ransackable_attributes(*)
    %w[visit category_id compartment_id reserved_id prefecture_id budget_id user_id]
  end

  def self.ransackable_associations(*)
    %w[user category compartment reserved prefecture budget image]
  end
end
