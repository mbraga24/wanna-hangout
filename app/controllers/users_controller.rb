class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @age_choice = (18..70).to_a
    @hobbies = ['3D printing', 'Amateur radio', 'Scrapbook', 'Amateur radio', 'Acting', 'Baton twirling', 'Board games', 'Book restoration', 'Cabaret'];
    @user = User.new
  end

  def create
    user = User.new(user_params)
    # User will be logedin upon creation
    session[:user_id] = user.id

    if user.save
      redirect_to user_path(user)    
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation, :first_name, :last_name, :age, :bio, interest_ids:[])
  end
end