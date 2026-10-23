class CommunityCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community
  before_action :set_community_comment, only: [:edit, :update, :destroy]
  
  def create
    unless @community.users.include?(current_user)
      redirect_to community_path(@community),
                  alert: "コメントを投稿するにはコミュニティへの参加が必要です。"
      return
    end

    @community_comment = @community.community_comments.new(community_comment_params)
    @community_comment.user = current_user

    if @community_comment.save
      redirect_to community_path(@community),
                  notice: "コメントを投稿しました"
    else
      render "communities/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @community_comment.update(community_comment_params)
      redirect_to community_path(@community),
                  notice: "コメントを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @community_comment.update(is_active: false)

    redirect_to community_path(@community),
                notice: "コメントを削除しました"
  end

  private
  def set_community
    @community = Community.find(params[:community_id])
  end

  def set_community_comment
    @community_comment = CommunityComment.find(params[:id])
  end
  def community_comment_params
    params.require(:community_comment).permit(:body)
  end
end
