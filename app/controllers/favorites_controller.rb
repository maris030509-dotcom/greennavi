class FavoritesController < ApplicationController
  before_action :authenticate_user!
  def index
    @favorite_parks = current_user.favorite_parks
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
end
