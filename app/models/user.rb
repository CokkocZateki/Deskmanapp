class User < ActiveRecord::Base
	has_secure_password
	has_many :shifts
	has_one :desk

	validates :username, length: { minimum: 2 }, uniqueness: true
	validates :email, uniqueness: true, format: { 
		with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
		message: 'Please enter a valid email'
	}
	validates :desk_id,  with: :valid_desk_id
	validates :accesslevel, with: :valid_accesslevel

	def valid_accesslevel
		puts "#{self.accesslevel} is the accesslevel"
		puts "true" if self.accesslevel == "attendant"
		if self.accesslevel == "admin"
			nil
		elsif self.accesslevel == "attendant"
			nil
		elsif self.accesslevel == "GC"
			nil
		else
			errors.add(:base, 'Invalid accesslevel')
		end
	end

	def valid_desk_id
		puts "This is called"
		if !Desk.find_by_id(self.desk_id)
			errors.add(:base, 'Invalid desk_id')
		end
	end



end
