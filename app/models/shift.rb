class Shift < ActiveRecord::Base
	belongs_to :user
	belongs_to :desk


	def self.create_multiple_shifts(mshiftparams)
		startShiftBlock = mshiftparams['shifts_start']
		puts startShiftBlock
		endShiftBlock = mshiftparams['shifts_end']
		puts endShiftBlock
		if mshiftparams['shifts_per_day'] == 'Custom Shifts'
			customHours = mshiftparams['custom_shifts_per_day_hour'].values
			.map { |e| e == 'end' ? 24 : e.to_i }
			print customHours
			puts '\n'
			print customHours.sort
			assert customHours == customHours.sort, "Must be in ascending order"
		else
			shiftsPerDay = mshiftparams['shifts_per_day']
			puts shiftsPerDay
		end
		graveyards = mshiftparams['graveyard']
		specialPay = mshiftparams['specialpay']
	end
end


