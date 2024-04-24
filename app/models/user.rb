class User < ApplicationRecord
    has_many :posts, dependent: :destroy
  
    validates :name, presence: { message: "must be provided" }
    validates :email, presence: { message: "must be provided" }, uniqueness: { message: "is already taken" }, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email address" }
    validates :password, presence: { message: "must be provided" }, length: { minimum: 6, message: "must be at least 6 characters long" }
  end