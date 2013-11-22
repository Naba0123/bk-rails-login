class SessionsController < ApplicationController

#  def current_user
#    @current_user ||= User.find(session[:user_id]) if session[:user_id]
#  end

#  helper_method :current_user

  def index
    render 'new'
  end
  
  def new
  end
  
  def create
    user = User.find_by_account params[:account]
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      render 'login_success', :notice => "Logged in!"
    else
      flash.now.alert = "Invalid account or password"
      render 'login_failure'
    end
  end
  
  def destroy
    session[:user_id] = nil
    render "new", :notice => "Logged out!"
  end
  
end
