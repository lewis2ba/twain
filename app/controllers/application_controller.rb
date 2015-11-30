class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # consider adding `before_action :authenticate_user!` if you want people to be logged in with devise before being able to access the app
end
