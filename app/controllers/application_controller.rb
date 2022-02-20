class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

    private
  def configure_permitted_parameters  # メソッド名は慣習
    # deviseのUserモデルにパラメーターを許可
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :name_family, :name_first, :name_family_kana, :name_first_kana, :birthday])
  end
end
