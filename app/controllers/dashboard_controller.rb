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
    @passwords = current_user.passwords
  
    password_counts = @passwords.group_by(&:password)
    @reused_passwords = password_counts.select { |_pwd, list| list.size > 1 }.values.flatten
  
    @weak_passwords = @passwords.select do |p|
      p.password.length < 8 || !p.password.match?(/[A-Z]/) || !p.password.match?(/\d/)
    end

    # Password strength categorization
    @strong_passwords = @passwords.select do |p|
      p.password.length >= 12 && p.password.match?(/[A-Z]/) && p.password.match?(/\d/) && p.password.match?(/[^A-Za-z0-9]/)
    end

    @medium_passwords = @passwords - @weak_passwords - @strong_passwords

    total_passwords = @passwords.count
    max_score = total_passwords.nonzero? ? total_passwords * 100 : 1

    strong_count = @strong_passwords.count
    medium_count = @medium_passwords.count
    weak_count = @weak_passwords.count

    actual_score = (strong_count * 100) + (medium_count * 60) + (weak_count * 20)

    reuse_penalty = @reused_passwords.uniq(&:id).count * 40
    actual_score -= reuse_penalty

    @security_score = [(actual_score.to_f / max_score) * 100, 0].max.round
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
