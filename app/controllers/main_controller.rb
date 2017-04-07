class MainController < ApplicationController
  def index
  	@spots = Spot.all
  end

  def about	
  end
end
