class RegistrationsController < Devise::RegistrationsController
  protected
  def update_resource(resource, params)
    changing_password = params[:password].present? || params[:password_confirmation].present?
    if changing_password
      resource.update_with_password(params)
    else
      params.delete(:current_password)
      resource.update_without_password(params) 
    end
  end
end
