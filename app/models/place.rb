class Place < ApplicationRecord
	validates :name,  presence: true, length: { minimum: 5, maximum: 50 }, uniqueness: { case_sensitive: false }
	validates :longitude,  presence: true
	validates :latitude,  presence: true
	validates_uniqueness_of :longitude, :scope => :latitude
	has_many :sources, :class_name => "Pickup", :foreign_key => :source_id, dependent: :destroy
    has_many :destinations, :class_name => "Pickup", :foreign_key => :destination_id, dependent: :destroy
    has_many :sources, :class_name => "Trip", :foreign_key => :source_id, dependent: :destroy
    has_many :destinations, :class_name => "Trip", :foreign_key => :destination_id, dependent: :destroy
end
