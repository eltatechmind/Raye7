class Place < ApplicationRecord
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :longitude,  presence: true
	validates :latitude,  presence: true
	validates_uniqueness_of :longitude, :scope => :latitude

end
