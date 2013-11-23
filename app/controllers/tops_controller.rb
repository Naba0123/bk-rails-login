class TopsController < ApplicationController

  def index
    @current_user ||= User.find(session[:user_id])
    render 'index'
  end

end
