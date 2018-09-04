class TripsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :delete]
  before_action :correct_trip,   only: [ :edit, :update, :delete]
  before_action :confirm_role, only: [ :new, :create, :edit, :update, :delete]

  def new
    @user = current_user
    @trip = @user.trips.new
    @place = Place.all
  end

  def create
    @user = current_user
    @place = Place.all
    @trip = @user.trips.new(trip_params)
    if @trip.save
      flash[:success] = "Trip Added Successfully"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def edit
    @trip = Trip.find(params[:id])
    @place = Place.all
  end


  def update
  	@place = Place.all
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(trip_params)
      flash[:success] = "Trip edited"
      redirect_to current_user
    else
      render 'edit'
    end
  end

  def delete
    @trip = Trip.find(params[:id])
    if !@trip.nil?
      @trip.destroy
      render json: { success_message: "Success!, Trip is deleted." }, status: :ok
    end
  end



  private

  

  def trip_params
      params.require(:trip).permit(:user_id, :source_id, :destination_id, :seatsno, :dtime)
  end

  # Before filters

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the trip belongs to the current user.
  def correct_trip
      @user = current_user
      @trip = Trip.find(params[:id])
      redirect_to(root_url) unless @trip.user_id == @user.id
  end

  # Confirms the user role is Driver
  def confirm_role
      redirect_to(root_url) unless current_user.role == 'Driver'
  end

end
