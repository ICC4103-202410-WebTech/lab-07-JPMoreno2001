class User < ApplicationRecord
    has_many :posts, dependent: :destroy
  
    validates :name, presence: { message: "must be provided" }
    validates :email, presence: { message: "must be provided" },
                      uniqueness: { message: "is already taken" },
                      format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }
    validates :password, presence: { message: "must be provided" }, length: { minimum: 6, message: "must be at least 6 characters long" }
end
  
class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags

    validates :title, presence: { message: "must be provided" }
    validates :content, presence: { message: "must be provided" }
    validates :user_id, presence: { message: "must be provided" }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0, message: "must be equal to or greater than 0" }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0, message: "must be equal to or greater than 0" }
end

class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    has_many :posts, through: :post_tags

    validates :name, presence: { message: "must be provided" }, uniqueness: { message: "is already taken" }
end

class PostTag < ApplicationRecord
    belongs_to :post
    belongs_to :tag
end
  