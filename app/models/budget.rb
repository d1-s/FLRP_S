class Budget < ActiveHash::Base
  self.data = [
    { id: 1, name: ' ~ 1,000円' },
    { id: 2, name: '1,000円 ~ 3,000円' },
    { id: 3, name: '3,000円 ~ 5,000円' },
    { id: 4, name: '5,000円 ~ 10,000円' },
    { id: 5, name: '10,000円 ~ ' }
  ]

  include ActiveHash::Associations
  has_many :posts
end
