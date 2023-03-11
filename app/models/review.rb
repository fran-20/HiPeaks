class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mountain
  has_one_attached :image do |attachable|
    attachable.variant :display, resize_to_limit: [300, 400]
  end
  default_scope -> { order(created_at: :desc) }
  validates :score, presence: true
  validates :image,   content_type: { in: %w[image/jpeg image/gif image/png],
                                      message: "must be a valid image format" },
                      size: { less_than: 5.megabytes,
                              message:   "should be less than 5MB" }
end
