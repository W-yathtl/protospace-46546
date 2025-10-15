class ApplicationController < ActionController::Base

  before_action :authenticate_user!

  # deviseのアクションの前に実行されるメソッド
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  # sign_upの際，nicknameを取得するストロングパラメーター
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :profile, :occupation, :position, :position])
  end
end
