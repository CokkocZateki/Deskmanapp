class User < ActiveRecord::Base
	has_secure_password
	has_many :shifts
	#attr_accessor :password
end
