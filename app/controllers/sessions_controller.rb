class SessionsController < ApplicationController
  def new
  end

  def create
    # params[:session] => <ActionController::Parameters {"username"=>"sk"} permitted: false>
    # params[:session][:username] => sk
    user = User.find_by(username: params[:session][:username].downcase)
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to home_path
  end
end