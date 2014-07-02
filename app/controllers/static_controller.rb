class StaticController < ApplicationController
  def home
  	@shift = Shift.new
  end

  def calendar
  end

  def take_shift
  	puts "This is params: #{params}"
  	@shift = Shift.find_by_id(params[:shift_id])
  	@shift.user_id = session[:user_id]
  	@shift.sub_needed = false
  	@shift.save
  	puts @shift

  	#respond_with(flash[:success] = "Shift successfully taken!")
  	redirect_to "/shifts/#{params[:shift_id]}"
  	
  end

  def sub_shift
  	@shift = Shift.find_by_id(params[:shift_id])
  	@shift.sub_needed = true
  	@shift.save
  	redirect_to "/shifts/#{params[:shift_id]}"
  end

end
