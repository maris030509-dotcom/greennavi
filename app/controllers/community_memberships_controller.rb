class CommunityMembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    community = Community.find(params[:community_id])

    current_user.community_memberships.find_or_create_by(
      community: community
    )

    redirect_to community_path(community),
                notice: "コミュニティに参加しました"
  end

  def destroy
    community = Community.find(params[:community_id])

    community_membership = current_user.community_memberships.find_by(
      community: community
    )

    community_membership&.destroy

    redirect_to community_path(community),
                notice: "コミュニティから退会しました"
  end
end
