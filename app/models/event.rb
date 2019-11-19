class Event < ApplicationRecord
	has_many :addresses
	belongs_to :user
	validates :name, presence: true
	validates :location, presence: true
end
