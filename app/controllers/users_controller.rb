class UsersController < ApplicationController

  skip_before_filter :check_logined

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to sessions_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
end
