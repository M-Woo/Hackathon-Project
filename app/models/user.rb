class User < ApplicationRecord
	has_many :spots
	has_many :bookings
	
	validates :email,
	presence: true,
	uniqueness: {case_sensitive: false}

	has_secure_password

	validates :password, length: {in: 8..36}, on: :create

	def self.authenticate(params)
    	User.find_by_email(params[:email]).try(:authenticate, params[:password]);
  	end
end
