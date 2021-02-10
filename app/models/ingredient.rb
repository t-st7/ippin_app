class Ingredient < ApplicationRecord
  belongs_to :post
  with_options presence: true do
  validates :topping
  end
end
