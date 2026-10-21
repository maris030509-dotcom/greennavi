class CommunitiesController < ApplicationController
  def index
    @communities = Community.order(created_at: :desc)
  end

  def show
    @community = Community.find(params[:id])
    @community_comment = CommunityComment.new
  end

end
