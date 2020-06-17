class SessionsController < ApplicationController
  def new_form
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)

    # if user exists AND the user password is correct we initiae a session 
    # (.authenticate - checks for the correct encoded password from bcrypt)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      # Will keep user (render) on the new view
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end