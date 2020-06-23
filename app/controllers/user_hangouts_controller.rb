class UserHangoutsController < ApplicationController
  def new
    @userhangout = UserHangout.new
  end

  def create
    location_type = ["Restaurant", "Park", "Movie theater", "Museum", "Roof Top", "Club", "Pub", "Church"]
    user = User.find_by(id: params[:user_hangout][:user_id])
    
    if UserHangout.find_by(user_id: user.id) == nil
      flash[:success] = "Great! You're going on a hangout!"
      set_hangout = Hangout.create()
      UserHangout.create(user_id: current_user.id, hangout_id: set_hangout.id)
      UserHangout.create(user_id: user.id, hangout_id: set_hangout.id)


      redirect_to user_path(current_user)
    else
      redirect_to new_user_hangout_path
    end
  end

  def destroy
    hang = UserHangout.find_by(user_id: params[:id])
    UserHangout.where(hangout_id: hang.hangout_id).destroy_all
    hang.destroy
    flash[:warning] = "It's okay. We're working on finding you other matches."
    redirect_to user_path(current_user)
  end
end
