class Vote < ApplicationRecord
  belongs_to :survey
  validates :value, presence: true, numericality: true, inclusion: { in: 0..1, message: "Value should be Yes, No, or Skip"} 

  def votes_sum
  	@votes_sum ||= self.votes.sum(:value)
  end 

  def percent_yes
  	@percent_yes ||= votes_sum * 100 / self.votes.count
  end	

  def percent_no
  	@percent_no ||= 100 - votes_percent_yes
  end	
  
end
