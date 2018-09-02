class User < ApplicationRecord
  # one to many relationship with pickup model
  has_many :pickups, dependent: :destroy
  # one to many relationship with trip model
  has_many :trips, dependent: :destroy
  # attribute accessor for remember_token to update it and access it's value
	attr_accessor :remember_token
  # name can't be blank, and of length 5 to 50 chars
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }
  # simple regex for the accepted phone number, must be consists of numbers only
	VALID_PHONE_REGEX = /\A[0-9]+\z/
  # phone length must be 10 numbers, using the phone regex, must be present not blank, and must be unique per account
	validates :phone, length: { minimum: 10, maximum: 10 },format: { with: VALID_PHONE_REGEX }, presence: true, uniqueness: true
  # role must be either driver or passenger
  validates :role, presence: true, inclusion: { in: ["Driver","Passenger"] }
  # use for password validations (sure strong enough, existing of password, etc)
  has_secure_password
  # password must be present not blank, length minimum 6 char, allow nil true to avoid the same error appears twice because of has-secure-password validation
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # Returns the hash digest of the given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
  	def User.new_token
        SecureRandom.urlsafe_base64
  	end

  	# Remembers a user in the database for use in persistent sessions.
    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    # Forgets a user.
  	def forget
      update_attribute(:remember_digest, nil)
  	end
end