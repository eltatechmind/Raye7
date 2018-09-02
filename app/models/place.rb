class Place < ApplicationRecord
	#the place name, must exist, length between 5 to 50 chars, uniquness case sensitivity disabled (ElMaadi == elmaadi)
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: { case_sensitive: false }
	#longitude must exist
	validates :longitude,  presence: true
	#latitude must exist
	validates :latitude,  presence: true
	#longitude and latitude uniquness of both together
	validates_uniqueness_of :longitude, :scope => :latitude
	#one to many relation with pickup model in two attributes (source_id, destination_id)
	has_many :sources, :class_name => "Pickup", :foreign_key => :source_id, dependent: :destroy
    has_many :destinations, :class_name => "Pickup", :foreign_key => :destination_id, dependent: :destroy
    #one to many relation with trip model in two attributes (source_id, destination_id)
    has_many :sources, :class_name => "Trip", :foreign_key => :source_id, dependent: :destroy
    has_many :destinations, :class_name => "Trip", :foreign_key => :destination_id, dependent: :destroy
end
