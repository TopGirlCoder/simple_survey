class Survey < ApplicationRecord
	has_many :votes, dependent: :destroy 
	# validates: question, presence: true, uniqueness: { case_sensitive: false, message: ' is a duplicate. Please try a new question.'}

end
