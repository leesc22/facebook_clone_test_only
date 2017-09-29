class User < ApplicationRecord
	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy

	validates :name, :email, :password_confirmation, presence: true
	validates :email, uniqueness: true
	validates :password, length: { in: 6..20 }
	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Invalid email format!" }

	has_secure_password # also validates presence

	def self.authenticate(session_params)
		User.find_by(email: session_params[:email]).try(:authenticate, session_params[:password])
	end
end
