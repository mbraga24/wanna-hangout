class UserHangoutsController < ApplicationController

  def new
    @userhangout = UserHangout.new
  end

  def create
    location_type = ["Restaurant", "Park", "Movie theater", "Museum", "Roof Top", "Club", "Pub", "Church"]
    user = User.find_by(id: params[:user_hangout][:user_id])
  
    set_hangout = Hangout.create(activity: location_type.sample, location_id: user.location_id)
    set_user_hangout = UserHangout.create(user_id: current_user.id, hangout_id: set_hangout.id)
    UserHangout.create(user_id: user.id, hangout_id: set_hangout.id)
    if set_user_hangout
      redirect_to users_path
    end
  end

  private

  # def userhangout_params
  #   params.require(:userhangout).permit(:user_id)
  # end

end
