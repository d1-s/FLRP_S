class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '1人で気軽に行ける' },
    { id: 2, name: 'カップルにおすすめ' },
    { id: 3, name: '女子会にピッタリ！' },
    { id: 4, name: '歓送迎会など大人数の飲み会も可' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
