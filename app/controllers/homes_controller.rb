class HomesController < ApplicationController
  def about
    @parks = Park.all
  end
end
