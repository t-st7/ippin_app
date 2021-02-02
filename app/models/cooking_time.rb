class CookingTime < ActiveHash::Base
  self.data = [
   { id: 1, name: '----------------' },
   { id: 2, name: '0~1分' },
   { id: 3, name: '1~3分' },
   { id: 4, name: '3~5分' },
   { id: 5, name: '5~10分' },
   { id: 6, name: '10~15分' }
  ]

  include ActiveHash::Associations
  has_many :posts
end