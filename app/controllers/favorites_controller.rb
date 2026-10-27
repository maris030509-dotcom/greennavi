class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :reject_guest_user, only: [:create]

  def index
    @favorite_parks = current_user.favorite_parks
    @show_unfavorite_button = true
  end

  def create
    park = Park.find(params[:park_id])
    current_user.favorites.find_or_create_by!(park: park)
    redirect_to park_path(park), notice: "お気に入りに追加しました"
  end

  def destroy
    park = Park.find(params[:park_id])
    current_user.favorites.find_by(park: park)&.destroy
    redirect_back fallback_location: park_path(park),
                  notice: "お気に入りを解除しました"
  end

  private
  def reject_guest_user
    if current_user&.guest_user?
      redirect_back(
        fallback_location: root_path,
        alert: "お気に入り登録には会員登録が必要です"
      )
    end
  end
end
