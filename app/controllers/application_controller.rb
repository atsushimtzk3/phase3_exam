class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  before_action :logged_in?
  
  def logged_in?
    if session[:user_id]
      begin
        @current_user = User.find_by(user_id: session[:user_id])
      rescue ActiveRecord::RecordNotFound
        reset_user_session
      end
    end
    return if @current_user
    # @current_userが取得できなかった場合はログイン画面にリダイレクト
    redirect_to new_session_path
  end
  
  def reset_user_session
    session[:user_id] = nil
    @current_user = nil
  end  
  
end
