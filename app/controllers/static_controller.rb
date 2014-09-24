class StaticController < ApplicationController
  before_action :authenticate_user!

  def home
  	# if session[:user_id]
   #    redirect_to "/users/#{session[:user_id]}"
   #  else
   #    redirect_to login_path
   #  end
  end

  def calendar
    puts current_user
  end

  def take_shift
    @shift = Shift.find_by_id(params[:shift_id])
    if current_user && (@shift.sub_needed == true)
    	puts "This is params: #{params}"
    	@shift.user_id = current_user.id
    	@shift.sub_needed = false
    	@shift.save
    	puts @shift
      respond_to do |format|
        format.html { render :text => 'Shift Successfully Taken' }
        format.json { render status: :ok }
      end
    else
      puts "It didn't work"
      respond_to do |format|
        format.html { render :text => 'Shift Not Taken', status: :forbidden }
        format.json { render status: :forbidden }
      end
    end
  	# respond_with(render calendar, flash[:success] = "Shift successfully taken!")
  	#redirect_to "/shifts/#{params[:shift_id]}"	
  end

  def sub_shift
    @shift = Shift.find_by_id(params[:shift_id])
    user_owns_shift = (@shift.user_id == current_user.id)
    puts user_owns_shift
    puts @shift.sub_needed
    if current_user && user_owns_shift && (@shift.sub_needed == false)
    	@shift = Shift.find_by_id(params[:shift_id])
    	@shift.sub_needed = true
    	@shift.save
    	# redirect_to "/shifts/#{params[:shift_id]}"
      respond_to do |format|
        format.html { render :text => 'Shift Is Now Available For Others To Sub' }
        format.json { render status: :ok }
      end
    else
      respond_to do |format|
        format.html { render :text => 'This Shift Cannot Be Subbed', 
          status: :forbidden }
        format.json { render status: :forbidden }
      end
    end
  end

end
