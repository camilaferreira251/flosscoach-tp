# Class to validade all params to user, register can be do with aplication
# register, facebook, github and twitter, connecting whith yours respectives
# API's. 

require "bcrypt"

class User < ActiveRecord::Base
  # Indicates users can have many projects associated
  has_many :projects
  
  # Validate atributes email and name
  validates_presence_of :email, :name

  # Validate atribute password
  validates_presence_of :password,  :if => :password

  # Validate if email is one
  validates_uniqueness_of :email

  # Validate the lenth of the atribute password
  validates_length_of :password, minimum: 6, :if => :password

  #Validates if confirmation passwor is equal password 
  validates_confirmation_of :password, :if => :password

  # Validate if terms are acepted
  validates_acceptance_of :terms

  #set password  encrypted
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


  #find user with ominiauth
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
