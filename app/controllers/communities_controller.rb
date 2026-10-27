class CommunitiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :reject_guest_user, only: [:new, :create]

  
  def index
    @communities = Community.where(is_active: true)
                            .order(created_at: :desc)
  end

  def show
    @community = Community.find(params[:id])
    @community_comment = CommunityComment.new
    #コミュニティ停止中は表示しない
    unless @community.is_active?
      redirect_to communities_path,
                  alert: "このコミュニティは停止中です"
      return
    end
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to community_path(@community), notice: "コミュニティを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  private
  def community_params
    params.require(:community).permit(:name, :introduction)
  end

  def reject_guest_user
    if current_user&.guest_user?
      redirect_back(
        fallback_location: root_path,
        alert: "ゲストユーザーは閲覧のみ可能です"
      )
    end
  end

end
