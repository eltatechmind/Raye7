class Pickup < ApplicationRecord
	#time must be exist, time.current for the rails app ActiveRecord local time which was set to cairo in application.rb
	#time of the pickup can be between present time and up to next month maximum
	validates :dtime, presence: true, inclusion: { in: (Time.current..Time.current+1.months) }
	# many to one relation with User model
	belongs_to :user
	# many to one relation with place model, for both two columns (source_id, destination_id)
	belongs_to :source, :class_name => "Place", :foreign_key => :source_id
    belongs_to :destination, :class_name => "Place", :foreign_key => :destination_id
    #custom validator created, to ensure that source_id and destination_id cannot be the same
    validate :source_and_destination_are_not_equal
	def source_and_destination_are_not_equal
	  self.errors.add(:base, 'Source and destination cannot be the same.') if self.source_id == self.destination_id
	end
end
