class ParksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_park, only: [:show, :edit, :update, :destroy]
  before_action :set_master_data, only: [:new, :create, :edit, :update]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  
  def index
    @parks = Park.order(created_at: :desc)
  end

  def show
    @park_comment = ParkComment.new
  end

  def new
    @park = Park.new
  end

  def create
    @park = Park.new(park_params)
    @park.user = current_user
    if @park.save
      redirect_to park_path(@park), notice:"投稿完了しました"
    else
      flash.now[:alert] = "入力内容に誤りがあります"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @park.update(park_params)
      redirect_to park_path(@park), notice:"更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @park.destroy
    redirect_to my_page_users_path, notice: "削除しました"
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


