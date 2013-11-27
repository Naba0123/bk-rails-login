class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery
  
  before_filter :check_logined
  
  helper_method :current_user
  
  private
  
  def current_user  
    @current_user ||= User.find(session[:user_id])
  end
  
  def check_logined
    if session[:user_id]
      begin
        @user = User.find(session[:user_id])
      rescue ActiveRecord::RecordNotFound
#        logger.error "セッションの情報(" + session[:user_id] + ")は user_infos には存在しません。"
        reset_session
      end
    end

    unless @user
      redirect_to sessions_path
    end
  end
  
end
