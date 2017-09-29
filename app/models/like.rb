class Like < ApplicationRecord
	belongs_to :user
	belongs_to :status
	
	validates :user_id, :status_id, presence: true
end
