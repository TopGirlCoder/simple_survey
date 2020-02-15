class Vote < ApplicationRecord
  belongs_to :survey
  validates :value, presence: true

  def get_value
  	self.value == 1 ? "Yes" : "No"
  end	
end
