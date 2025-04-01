class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is logged in

  def index
  #cover this to show main page
   @passwords = current_user.password  # Assuming you have a Password model associated with the user
    # You can add more instance variables for Secure Notes, Watch Tower, etc., if needed.
  end

 #remove this to show main page
 # skip_before_action :authenticate_user!, only: [:index]
end
