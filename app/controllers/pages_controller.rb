class PagesController < ApplicationController
  def home
    redirect_to user_path(current_user) if logged_in?
  end

  def new_form
    respond_to do |format|
      format.html
      format.js
    end
  end
end
