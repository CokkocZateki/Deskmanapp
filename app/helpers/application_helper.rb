module ApplicationHelper
	private
	def current_user
		#puts "User id of session is " + session[:user_id]
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id]) 
		else
			nil
		end
	end

end
