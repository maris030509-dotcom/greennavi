class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #　全ページログイン必須、Devise画面は例外
  before_action :authenticate_user!, unless: :devise_controller?
  
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
