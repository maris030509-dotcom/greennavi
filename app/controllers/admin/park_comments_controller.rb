class Admin::ParkCommentsController < Admin::ApplicationController
  def destroy
    @park = Park.find(params[:id])
    @park_comment = @park.park_comments.find(params[:id])
    @park_comment.update(is_active: false)
      redirect_to admin_park_path(@park), notice: "コメントを削除しました"
  end
end
