class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :surveys, class_name: 'Survey', foreign_key: :surveyor_id
  has_many :votes, class_name: 'Vote', foreign_key: :voter_id      

end
