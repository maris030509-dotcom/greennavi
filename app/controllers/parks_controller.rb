class ParksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
    @park = Park.new
    @prefectures = Prefecture.all
    @equipments = Equipment.all
    @playgrounds = Playground.all
  end

  def create
    @park = Park.new(park_params)
    @park.user = current_user
    @prefectures = Prefecture.all
    @equipments = Equipment.all
    @playgrounds = Playground.all
    if @park.save
      redirect_to park_path(@park), notice:"投稿完了しました"
    else
      flash.now[:alert] = "入力内容に誤りがあります"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @park = Park.find(params[:id])
    @prefectures = Prefecture.all
    @equipments = Equipment.all
    @playgrounds = Playground.all
  end

  def update
    @park = Park.find(params[:id])
    @prefectures = Prefecture.all
    @equipments = Equipment.all
    @playgrounds = Playground.all
    if @park.update(park_params)
      redirect_to park_path(@park), notice:"更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  def destroy
    @park = Park.find(params[:id])
    @park.destroy
    redirect_to my_page_users_path, notice: "削除しました"
  end

  private
  def park_params
    params.require(:park).permit(
      :park_image, :name, :introduction, 
      :prefecture_id, :address, 
      equipment_ids: [], playground_ids: []
      )
  end

end


