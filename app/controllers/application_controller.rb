class ApplicationController < ActionController::Base
  before_action :authenticate_user! 
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end
  
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :sex, :sex_hidden, :age, :age_hidden, :income, :income_hidden, :industry, :job, :introduction])
  end
  
end
