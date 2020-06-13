class SessionsController < ApplicationController
  def new
  end

  def create
    # byebug
    # params[:session] => <ActionController::Parameters {"username"=>"sk"} permitted: false>
    # params[:session][:username] => sk
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      # byebug
      session[:user_id] = user.id
      # byebug
      redirect_to user_path(user)
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end