class Admin::PrefecturesController < Admin::ApplicationController
  before_action :set_prefecture, only: [:edit, :update]
  def index
    @prefectures = Prefecture.all
    @prefecture = Prefecture.new
  end

  def create
    @prefecture = Prefecture.new(prefecture_params)
    if @prefecture.save
      redirect_to admin_prefectures_path, notice: "都道府県を追加しました"
    else
      @prefectures = Prefecture.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @prefecture.update(prefecture_params)
      redirect_to admin_prefectures_path, notice: "都道府県名を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def set_prefecture
    @prefecture = Prefecture.find(params[:id])
  end

  def prefecture_params
    params.require(:prefecture).permit(:name)
  end
end
