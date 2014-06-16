class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
    	session[:user_id] = user.id
    	redirect_to "/static/calendar", :notice => "Logged In!"
    else
    	flash[:notice] = "Invalid Email or Password"
    	render "new"
    end
  end
end
