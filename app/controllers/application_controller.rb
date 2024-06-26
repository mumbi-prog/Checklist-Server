class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :require_login
  
    helper_method :current_user, :logged_in?
  
    private
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  
    def logged_in?
      !!current_user
    end
  
    def require_login
      unless logged_in?
        render json: { status: 'error', message: 'Unauthorized' }, status: :unauthorized
      end
    end
  end
  