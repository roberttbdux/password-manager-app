class DashboardController < ApplicationController
  before_action :authenticate_user!  # Ensure the user is logged in

  def passwords
  #cover this to show main page
   @passwords = current_user.password  # Assuming you have a Password model associated with the user
    # You can add more instance variables for Secure Notes, Watch Tower, etc., if needed.
  end
  
  def passwords
    @passwords = Password.where(user_id: current_user.id)
  end

  def watchtower
  end

  def profile
    @user = current_user
  end
  
  def update_profile
    if password_being_updated?
      if current_user.update_with_password(profile_params)
        bypass_sign_in(current_user)  # Keeps user signed in
        redirect_to dashboard_profile_path, notice: "Profile updated successfully."
      else
        render :profile
      end
    else
      # Only update name and email — skip password and current_password
      if current_user.update(profile_params.except(:password, :current_password))
        redirect_to dashboard_profile_path, notice: "Profile updated successfully."
      else
        render :profile
      end
    end
  end
  
  private
  
  def profile_params
    params.require(:user).permit(:name, :email, :password, :current_password)
  end
  
  def password_being_updated?
    params[:user][:password].present?
  end
  
  
  
 #remove this to show main page
 # skip_before_action :authenticate_user!, only: [:index]
end
