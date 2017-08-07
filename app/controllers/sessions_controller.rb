# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.authenticate_with_credentials(params[:email], params[:password])
    if user
      # Success, save the user id inside the browser cookie
      session[:user_id] = user.id
      redirect_to '/'
    else
      # Failure, send user back to the login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end