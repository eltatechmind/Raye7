class PickupsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :delete]
  before_action :correct_pickup,   only: [ :delete]
  before_action :confirm_role, only: [ :new, :create, :delete]

  def new
    @user = current_user
    @pickup = @user.pickups.new
    @place = Place.all
  end

  def create
    @user = current_user
    @place = Place.all
    @pickup = @user.pickups.new(pickup_params)
    if @pickup.save
      flash[:success] = "Pickup Added Successfully"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def delete
    @pickup = Pickup.find(params[:id])
    if !@pickup.nil?
      @trip = Trip.where(id: @pickup.trip_id).first
      if !@trip.nil?
        @trip.seatsno = @trip.seatsno + 1
        @trip.save
      end
      @pickup.destroy
      render json: { success_message: "Success!, Pickup is deleted." }, status: :ok
    end
  end



  private

  

  def pickup_params
      params.require(:pickup).permit(:user_id, :source_id, :destination_id, :dtime, :trip_driver, :trip_id, :trip_dtime)
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

  # Confirms the pickup belongs to the current user.
  def correct_pickup
      @user = current_user
      @pickup = Pickup.find(params[:id])
      redirect_to(root_url) unless @pickup.user_id == @user.id
  end

  # Confirms the user role is Passenger
  def confirm_role
      redirect_to(root_url) unless current_user.role == 'Passenger'
  end
  
end
