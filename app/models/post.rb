class Post < ApplicationRecord
  has_rich_text :title
  has_many :comments
  belongs_to :user
  belongs_to :user, optional: true, foreign_key: "user_id" # , dependent: :cascade
  has_many :likes
end
