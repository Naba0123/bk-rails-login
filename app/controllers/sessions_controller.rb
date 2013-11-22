class SessionsController < ApplicationController
  def index
    render 'new'
  end
  
  def create
    user = User.find_by_account params[:account]
    if user && user.authenticate(params[:pass])
      session[:user_id] = user.id
      render 'login_success'
    else
      render 'login_failure'
    end
  end
  
  def destroy
    session[:user_id] = nil
    render "new"
  end
end
