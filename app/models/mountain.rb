class Mountain < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def avg_level
    unless self.reviews.empty?
      reviews.average(:level).round(1).to_f
    else
      0.0
    end
  end
  
end