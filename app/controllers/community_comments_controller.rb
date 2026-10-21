class CommunityCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_community
  before_action :set_community_comment, only: [:edit, :update, :destroy]
  def create
    @community_comment = current_user.community_comments.build(community_comment_params)
    @community_comment.community = @community

    if @community_comment.save
      @community_comment = CommunityComment.new

      respond_to do |format|
        format.turbo_stream
      end
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
    @community_comment = current_user.community_comments.find(params[:id])
  end
  def community_comment_params
    params.require(:community_comment).permit(:body)
  end
end
