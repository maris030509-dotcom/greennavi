class Admin::CommunityCommentsController < Admin::ApplicationController
  def destroy
    @community = Community.find(params[:community_id])
    @community_comment = CommunityComment.find(params[:id])
    @community_comment.update(is_active: false)
    redirect_to admin_community_path(@community),
                notice: "コメントを削除しました"
  end
end
