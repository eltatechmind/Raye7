class PlacesController < ApplicationController
  def new
  end

  def show
  	@places = Place.all
  end
end
