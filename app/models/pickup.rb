class Pickup < ApplicationRecord
	validates :dtime, presence: true, inclusion: { in: (Time.current..Time.current+1.months) }
	belongs_to :user
	belongs_to :source, :class_name => "Place", :foreign_key => :source_id
    belongs_to :destination, :class_name => "Place", :foreign_key => :destination_id

    validate :source_and_destination_are_not_equal

	def source_and_destination_are_not_equal
	  self.errors.add(:base, 'Source and destination cannot be the same.') if self.source_id == self.destination_id
	end
end
