class UsersController < ApplicationController
  def index
    @users = User.all
    @hangout = Hangout.new
  end

  def show
    @user = User.find(params[:id])
  end

  def new_form
    @age_choice = (18..70).to_a
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.new(user_params)
    # user.save will save the user if it passes all validations on User model.
    if user.save
      # User will be logedin upon creation
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      render :new_form
    end 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.update(user_params)

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :location_id, :age, :bio, interest_ids:[])
  end
end