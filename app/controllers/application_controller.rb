class ApplicationController < ActionController::Base

  #allows us to give access for these method to all of our views
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      redirect_to home_path
    end 
  end
end

# https://www.theodinproject.com/courses/ruby-on-rails/lessons/sessions-cookies-and-authentication
