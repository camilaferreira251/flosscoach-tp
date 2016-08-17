require "bcrypt"

class User < ActiveRecord::Base
	has_many :projects
	
	validates_presence_of :email, :name
	validates_presence_of :password,  :if => :password
	validates_uniqueness_of :email
	validates_length_of :password, minimum: 6, :if => :password
	validates_confirmation_of :password, :if => :password
	validates_acceptance_of :terms

	def password=(new_password)
		@password = new_password
		self.encrypted_password = BCrypt::Password.create(@password)
	end

	def password
		@password
	end

	def valid_password?(password_to_validate)
		BCrypt::Password.new(encrypted_password) == password_to_validate
	end




	#TODO: Refactor
	def self.find_or_create_with_omniauth(auth)
	    user = self.find_or_create_by(:provider => auth.provider,:uid => auth.uid)
	    user.assign_attributes({ name: user.name || auth.info.name, 
	    	email: user.email || auth.info.email || "#{auth.info.name}@flosscoach.com", 
	    	photo_url: user.photo_url || auth.info.image, 
	    	fb_token: auth.credentials.token,
	    	password: "abababbbb", password_confirmation: "abababbbb"})
	    user.save!
	    user
	end
end
