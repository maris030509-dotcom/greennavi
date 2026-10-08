class ApplicationController < ActionController::Base
  allow_browser versions: :modern
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    my_page_users_path  # ログイン後にマイページへ
  end

  def after_sign_up_path_for(resource)
    my_page_users_path  # 新規登録後もマイページへ
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :name,
      :prefecture_id,
      :introduction
    ])

    devise_parameter_sanitizer.permit(:account_update, keys: [
      :name,
      :prefecture_id,
      :introduction
    ])
  end
end
