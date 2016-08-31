class ApplicationController < ActionController::Base
	layout :dd

	protected

	def dd
		if devise_controller? && action_name == "new"
			"dd"
		else
			"application"
		end
	end

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
