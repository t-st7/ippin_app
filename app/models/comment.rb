class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  with_options presence: true do
    validates :user_id
    validates :post_id
    validates :text
  end
end
