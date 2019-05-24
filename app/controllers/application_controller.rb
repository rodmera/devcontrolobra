class ApplicationController < ActionController::Base
	add_flash_types :success, :warning, :danger, :info
  protect_from_forgery with: :exception
  before_action :authenticate_user!
end
