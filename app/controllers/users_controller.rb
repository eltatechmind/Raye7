class UsersController < ApplicationController
    def new
   	  @user = User.new
    end

    def show
  	  @user = User.find(params[:id])
    end

    def create
      @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to Raye7 Web App"
        redirect_to @user
      else
        render 'new'
      end
    end



    private

    def user_params
      params.require(:user).permit(:name, :phone, :role, :password,
                                   :password_confirmation)
    end

end
