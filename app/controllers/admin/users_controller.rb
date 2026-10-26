class Admin::UsersController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.all
  end

  def show
    @parks = @user.parks.order(created_at: :desc)
    @communities = @user.communities.order(created_at: :desc)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: "ユーザーデータを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :prefecture_id, :introduction, :is_active )
  end
end
