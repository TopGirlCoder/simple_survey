class Vote < ApplicationRecord
  belongs_to :survey
  belongs_to :voter, class_name: 'User'
  
  validates :value, presence: true

  def get_value
  	self.value == 1 ? "Yes" : "No"
  end	

  def voter_email
  	User.find(self.voter_id).email
  end	

end
