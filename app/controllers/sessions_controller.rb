class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end