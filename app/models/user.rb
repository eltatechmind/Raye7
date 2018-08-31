class User < ApplicationRecord
	validates :name,  presence: true, length: { maximum: 50 }
	VALID_PHONE_REGEX = /\A[0-9]+\z/
	validates :phone, length: { minimum: 10, maximum: 10 },format: { with: VALID_PHONE_REGEX }, presence: true, uniqueness: true
    validates :role, presence: true, inclusion: { in: ["Driver","Passenger"] }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
end