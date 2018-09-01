class User < ApplicationRecord
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }
	VALID_PHONE_REGEX = /\A[0-9]+\z/
	validates :phone, length: { minimum: 10, maximum: 10 },format: { with: VALID_PHONE_REGEX }, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { in: ["Driver","Passenger"] }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

    # Returns the hash digest of the given string.
    def User.digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end
end