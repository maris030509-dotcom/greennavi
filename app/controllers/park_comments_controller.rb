class ParkCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_park
  before_action :set_park_comment, only: [:edit, :update, :destroy]
  before_action :reject_guest_user, only: [:create]

  def create
    @park_comment = current_user.park_comments.build(park_comment_params)
    @park_comment.park = @park

    if @park_comment.save
      @park_comment = ParkComment.new

      respond_to do |format|
        format.turbo_stream
      end
    else
      render "parks/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @park_comment.update(park_comment_params)
      redirect_to park_path(@park),
                  notice: "コメントを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @park_comment.update(is_active: false)

    redirect_to park_path(@park),
                notice: "コメントを削除しました"
  end

  private

  def set_park
    @park = Park.find(params[:park_id])
  end

  def set_park_comment
    @park_comment = current_user.park_comments.find(params[:id])
  end

  def reject_guest_user
    if current_user&.guest_user?
      redirect_back(
        fallback_location: root_path,
        alert: "ゲストユーザーは閲覧のみ可能です"
      )
    end
  end

  def park_comment_params
    params.require(:park_comment).permit(:body)
  end
end