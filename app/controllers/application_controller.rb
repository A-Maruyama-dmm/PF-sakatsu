class ApplicationController < ActionController::Base
  # ユーザー認証などが行われる前に、configure~が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:age,:sauna_years,:number_of_sets,:image_id,:admin])
  end
end
