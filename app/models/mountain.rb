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
  
  def active_hours
    unless self.reviews.empty?
      (reviews(:end) - reviews(:start) / 3600).round(0).to_t
    else
      0.0
    end
  end
  
  def active_minutes
    unless self.reviews.empty?
      (((review.end - review.start) % 3600) / 60).round(0)
    else
      0.0
    end
  end
  
end