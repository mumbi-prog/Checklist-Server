class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :logged_in]
  skip_before_action :verify_authenticity_token

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: { status: 'logged_in', user: user }, status: :ok
    else
      render json: { status: 'error', message: 'Invalid email or password' }, status: :unauthorized
    end
  end

  def destroy
    session[:user_id] = nil
    render json: { status: 'logged_out' }, status: :ok
  end

  def logged_in
    if logged_in?
      render json: { logged_in: true, user: current_user }
    else
      render json: { logged_in: false }
    end
  end
end
