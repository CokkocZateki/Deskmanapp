class Desk < ActiveRecord::Base
	has_many :shifts
	belongs_to :user
	validates_associated :users
end
