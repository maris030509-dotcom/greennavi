class SearchesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @keyword = params[:keyword]
    #検索機能　公園名もしくは都道府県で絞り込み
    @parks = if @keyword.present?
              Park.joins(:prefecture)
                  .where(
                    "parks.name LIKE :keyword OR prefectures.name LIKE :keyword",
                    keyword: "%#{@keyword}%"
                    )
             else
               Park.none
             end
  end
end
