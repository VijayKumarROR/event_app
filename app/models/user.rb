class User < ApplicationRecord
	validates :name, presence: true
	validates :email, presence: true, uniqueness: true
	has_many :addresses
	has_many :events
end
