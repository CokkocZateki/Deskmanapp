class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :shifts
	has_one :desk

	ROLES = %i[admin manager supervisor attendant]

	validates :email, uniqueness: true, format: { 
		with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
		message: 'Please enter a valid email'
	}
	# validates :password, :length => ()

	def self.admin?
		return self.role == 'admin' ? true : false
	end

	def self.manager?
		return self.role == 'manager' ? true : false
	end

	def self.supervisor?
		return self.role == 'supervisor' ? true : false
	end

	def self.attendant?
		return self.role == 'attendant' ? true : false
	end

	def valid_desk_id
		puts "This is called"
		if !Desk.find_by_id(self.desk_id)
			errors.add(:base, 'Invalid desk_id')
		end
	end



end
