class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_non_bar
    redirect_to root_path, alert: "You don't have access to this page" if current_user.bar?
  end

  def after_sign_in_path_for(_resource)
    stored_location_for(:user) || dashboard_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :club_id, :location, :bar, :bar_name, :bar_address])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :club_id, :location, :bar, :photo])
  end
end
