class Post < ApplicationRecord
    belongs_to :user
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
  
    validates :title, presence: { message: "must be provided" }
    validates :content, presence: { message: "must be provided" }
    validates :user_id, presence: { message: "must be provided" }
    validates :answers_count, numericality: { greater_than_or_equal_to: 0 }
    validates :likes_count, numericality: { greater_than_or_equal_to: 0 }
    before_validation :set_published_at
  
    private
  
    def set_published_at
      self.published_at ||= Time.zone.now
    end
  end