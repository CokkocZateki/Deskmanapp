class User < ActiveRecord::Base
	has_secure_password
	has_many :shifts
	has_one :desk
	#attr_accessor :password

	#validates :homedesk
end
