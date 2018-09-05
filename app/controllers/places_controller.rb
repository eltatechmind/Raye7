class PlacesController < ApplicationController
  def new
  end
  # show all places
  def show
  	@places = Place.all
  end
end
