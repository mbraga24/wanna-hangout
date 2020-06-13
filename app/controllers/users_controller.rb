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
    @user = User.create(user_params)

    if @user.valid?
      redirect_to user_path(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :first_name, :last_name, :age, :bio, :interests)
  end
end