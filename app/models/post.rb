class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments,    dependent: :destroy

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :cooking_time_id,     numericality: { other_than: 1 } 
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cooking_time
end
