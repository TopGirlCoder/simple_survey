class Vote < ApplicationRecord
  belongs_to :survey
  validates :value, presence: true, numericality: true, inclusion: { in: 0..1, message: "Value should be Yes, No, or Skip"} 

  def get_value
  	self.value == 1 ? "Yes" : "No"
  end	
end
