class ParkCommentsController < ApplicationController
  def create
    @park = Park.find(params[:park_id])
    @park_comment = current_user.park_comments.build(park_comment_params)
    @park_comment.park = @park

    if @park_comment.save
      @park_comment = ParkComment.new

      respond_to do |format|
        format.turbo_stream
      end
    else
      render "parks/show", status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def park_comment_params
    params.require(:park_comment).permit(:body)
  end

end
