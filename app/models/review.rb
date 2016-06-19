class Review < ActiveRecord::Base

  belongs_to :user
  belongs_to :product

  scope :newest_first, -> { order("created_at DESC")}

end
