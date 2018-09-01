class StaticPagesController < ApplicationController

 #the home page for the website (redirect to the user profile unless he's logged out)
  def home
    redirect_to current_user if current_user.present?
  end

  def help
  end

  def about
  end

  def contact
  end
end
