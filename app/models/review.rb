class Review < ApplicationRecord
  belongs_to :user
  belongs_to :mountain
  has_one_attached :image
  validates :score, presence: true
end
