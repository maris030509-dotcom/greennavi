class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user, except: [:show, :favorites]
  before_action :set_user, only: [:show, :favorites]

  def my_page
    #新しい投稿順に表示
    @parks = @user.parks.order(created_at: :desc)
    @communities = @user.communities.order(created_at: :desc)
  end

  def show
    @parks = @user.parks.order(created_at: :desc)
    @communities = @user.communities.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to my_page_users_path, notice: "プロフィールを更新しました"
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

  def favorites
    @favorite_parks = @user.favorite_parks
  end

  private
  def set_current_user
    @user = current_user
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :prefecture_id, :introduction )
  end

end
