class SessionsController < ApplicationController
   
  
  
  
    def logged_in
      if logged_in?
        render json: { logged_in: true, user: current_user }
      else
        render json: { logged_in: false }
      end
    end
  
    private
  
    def logged_in?
      !!session[:user_id]
    end
  
    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
  end
  