class Admin::EquipmentsController < Admin::ApplicationController
  def index
    @equipments = Equipment.all
    @equipment = Equipment.new
  end

  def create
    @equipment = Equipment.new(equipment_params)
    if @equipment.save
      redirect_to admin_equipments_path, notice: "設備を追加しました"
    else
      @equipments = Equipment.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @equipment = Equipment.find(params[:id])
  end

  def update
    @equipment = Equioment.find(params[:id])
    if @equipment.update(equipment_params)
      redirect_to admin_equipments_path, notice: "設備を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def equipment_params
    params.require(:equipment).permit(:name)
  end
end
