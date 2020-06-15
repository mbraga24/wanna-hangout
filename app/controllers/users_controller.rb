class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @age_choice = (18..70).to_a
    @user = User.new
  end

  def create
    user = User.new(user_params)

    # user.save will save the user if it passes all validations on User model.
    if user.save
      # User will be logedin upon creation,
      session[:user_id] = user.id
      redirect_to user_path(user)    
    else
      render :new
    end 
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :age, :bio, interest_ids:[])
  end
end