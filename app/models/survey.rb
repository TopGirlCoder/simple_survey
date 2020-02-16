class Survey < ApplicationRecord
	belongs_to :surveyor, class_name: 'User'
  has_many :votes, dependent: :destroy

	validates :question, presence: true, uniqueness: { case_sensitive: false, message: ' is a duplicate. Please try a new question.'}

  def no_votes
    @no_votes ||= votes_count - yes_votes
  end 

  def percent_no
    @percent_no ||= votes_count.nonzero? ? 100 - percent_yes : 0
  end   

  def percent_yes
  	@percent_yes ||= votes_count.nonzero? ? (yes_votes * 100 / votes_count) : 0
  end		  

  def votes_count
    @votes_count ||= self.votes.count
  end  

  def yes_votes
    @yes_votes ||= votes_count.nonzero? ? self.votes.sum(:value) : 0
  end 

end
