class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @keyword = params[:keyword]

    @parks = if @keyword.present?
               Park.where("name LIKE ?", "%#{@keyword}%")
             else
               Park.none
             end
  end
end
