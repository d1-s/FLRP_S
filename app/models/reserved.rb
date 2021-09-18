class Reserved < ActiveHash::Base
  self.data = [
    { id: 1, name: '貸切 不可' },
    { id: 2, name: '貸切 可' }
  ]

  include ActiveHash::Associations
  has_many :posts
end