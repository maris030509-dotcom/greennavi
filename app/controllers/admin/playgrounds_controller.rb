class Admin::PlaygroundsController < Admin::ApplicationController
  def index
    @playgrounds = Playground.all
    @playground = Playground.new
  end

  def create
    @playground = Playground.new(playground_params)
    if @playground.save
      redirect_to admin_playgrounds_path, notice: "遊具を追加しました"
    else
      @playgrounds = Playground.all
      render :index, status: :unprocessable_entity
    end
  end

  def edit
    @playground = Playground.find(params[:id])
  end

  def update
    @playground = Playground.find(params[:id])
    if @playground.update(playground_params)
      redirect_to admin_playgrounds_path, notice: "遊具名を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def playground_params
    params.require(:playground).permit(:name)
  end

end
