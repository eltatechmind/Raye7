class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :show]
  before_action :correct_user,   only: [:edit, :update, :show]
  # new action
  def new
 	  @user = User.new
  end
  # show action
  def show
	  @user = User.find(params[:id])
    @trip = @user.trips.where("trips.user_id= ?", @user.id).order('dtime')
    @pickup = @user.pickups.where("pickups.user_id= ?", @user.id).order('dtime')
    @pickup.each do |addr|
      # everytime you get the show page, you pickups will be (booked if not)
      if !addr.nil? && ( addr.trip_driver.nil? || addr.trip_driver == '' )
        x = Trip.where("dtime >= ? and dtime <= ? and dtime >= ? and source_id = ? and destination_id = ?  and seatsno > 0", addr.dtime-2.hours, addr.dtime+1.hours, Time.current, addr.source_id, addr.destination_id).order('dtime').first
        if !x.nil?
          addr.trip_driver = User.where(id: x.user_id).first.name
          addr.trip_id = x.id
          addr.trip_dtime = x.dtime
          x.seatsno = x.seatsno - 1
          x.save
          addr.save
        end
      end
    end

  end
  # create new user
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to Raye7 Web App"
      redirect_to @user
    else
      render 'new'
    end
  end
  # edit it
  def edit
    @user = User.find(params[:id])
  end
  # update the user, if changed from passenger to driver, all pickups will be destroyed, and vice versa
  def update
    @user = User.find(params[:id])
    role = @user.role
    if @user.update_attributes(user_params)
      if role == 'Driver' && @user.role == 'Passenger'
        @user.trips.destroy_all
        flash[:success] = "Your Profile had been updated, changed to Passenger and all your trips destroyed!"
      elsif role == 'Passenger' && @user.role == 'Driver'
        @user.pickups.destroy_all
        flash[:success] = "Your Profile had been updated, changed to Driver and all your Pickups destroyed!"
      else
        flash[:success] = "Profile updated"
      end
      redirect_to @user
    else
      render 'edit'
    end
  end





  private

  def user_params
    params.require(:user).permit(:name, :phone, :role, :password,
                                 :password_confirmation)
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

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
