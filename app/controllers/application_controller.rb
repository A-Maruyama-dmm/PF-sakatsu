class ApplicationController < ActionController::Base
  # ユーザー認証などが行われる前に、configure~が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:email,:age,:sauna_years,:number_of_sets,:image_id,:admin])
  end
end
