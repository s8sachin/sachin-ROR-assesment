class User < ActiveRecord::Base
	has_and_belongs_to_many :projects
	attr_accessor :password
	before_save :encrypt_password
	validates_presence_of :firstname, message: "Enter first name"
	validates_presence_of :lastname, message: "Enter last name"
	validates :password,  format: { with: /\A^(?=.*[a-zA-Z])(?=.*[0-9]).{6,}$\Z/, message: "Password Should contain 1 Uppercase, 1 Number, 1 Special Character and should be of minimum 8 Characters."}
	validates_presence_of :email, message: "Email cannot be empty"
	validates_uniqueness_of :email

	def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end

  end
end
