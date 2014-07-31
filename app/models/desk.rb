class Desk < ActiveRecord::Base
	has_many :shifts
	belongs_to :user
end
