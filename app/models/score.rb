class Score < ActiveRecord::Base
  
  attr_accessible \
    :title,
    :composer,
    :copyright,
    :music,
    :blocked
  
  
  validates :music,
    :presence => true
  
  
  scope :blocked,
    where(:blocked => true)
  
  scope :unblocked,
    where(:blocked => false)
  
end

