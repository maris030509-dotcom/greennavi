class CommunityMembershipsController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_guest_user, only: [:create]

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

  private
  def reject_guest_user
    if current_user&.guest_user?
      redirect_back(
        fallback_location: root_path,
        alert: "コミュニティに参加するには会員登録が必要です"
      )
    end
  end
end
