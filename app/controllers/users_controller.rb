class UsersController < ApplicationController
  before_action :authenticate_user!

  def my_page
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "プロフィールを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def unsubscribe
  end

  def withdraw
    @user.update(is_active: false)
    reset_session
    redirect_to root_path, notice: "退会処理が完了しました"
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :prefecture_id, :introduction )
  end

end
