class Admin::CommunitiesController < Admin::ApplicationController
  before_action :set_community, only: [:show, :edit, :update]
  def index
    @communities = Community.order(created_at: :desc)
  end

  def show
    @community_comment = CommunityComment.new
  end

  def new
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to admin_community_path(@community), notice: "コミュニティを作成しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @community.update(community_params)
      redirect_to admin_community_path(@community), notice: "コミュニティを更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @community.update(is_active: false)
    redirect_to admin_communities_path, notice:"削除しました"
  end
  
  private
  def set_community
    @community = Community.find(params[:id])
  end
  
  def community_params
    params.require(:community).permit(:name, :introduction, :is_active)
  end

end
