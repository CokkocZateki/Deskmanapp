module ApplicationHelper
	
	def flash_class(level)
	    case level
	        when :notice then "alert alert-info"
	        when :success then "alert alert-success"
	        when :error then "alert alert-danger"
	        when :alert then "alert alert-warning"
	    end
	end

	private
	def current_user
		puts "User id of session is #{session[:user_id]}"
		if session[:user_id]
			@current_user ||= User.find_by_id(session[:user_id]) 
		else
			nil
		end
	end

end
