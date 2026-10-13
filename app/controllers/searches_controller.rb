class SearchesController < ApplicationController
  def index
    @keyword = params[:keyword]

    @parks = if @keyword.present?
               Park.where("name LIKE ?", "%#{@keyword}%")
             else
               Park.none
             end
  end
end
