class HomesController < ApplicationController
  skip_before_action :authenticate_user!
  def about
    @parks = Park.all
  end
end
