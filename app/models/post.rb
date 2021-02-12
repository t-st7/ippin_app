class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments,    dependent: :destroy
  has_many :ingredients, dependent: :destroy
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  with_options presence: true do
    validates :title
    validates :description
    validates :image
    validates :cooking_time_id,     numericality: { other_than: 1 } 
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :cooking_time

  def save
    post = Post.create(title: title, description: description, image: image, cooking_time_id: cooking_time_id, user_id: user_id)
    Ingredient.create(topping: topping, gram: gram, post_id: post.id)
  end

 
end
