class Admin::ParksController < Admin::ApplicationController
  before_action :authenticate_admin!
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :set_master_data, only: [:edit, :update]

  def index
    @parks = Park.all
  end

  def show
    @park_comment = ParkComment.new
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to admin_park_path(@park), notice:"更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @park.destroy
    redirect_to admin_parks_path, notice: "削除しました"
  end

  private
  def set_park
    @park = Park.find(params[:id])
  end

  def set_master_data
    @prefectures = Prefecture.all
    @equipments = Equipment.all
    @playgrounds = Playground.all
  end


  def park_params
    params.require(:park).permit(
      :park_image, :name, :introduction, 
      :prefecture_id, :address, 
      equipment_ids: [], playground_ids: []
      )
  end

end
