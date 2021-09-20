class Compartment < ActiveHash::Base
  self.data = [
    { id: 1, name: '個室なし' },
    { id: 2, name: '個室あり' }
  ]

  include ActiveHash::Associations
  has_many :posts
end