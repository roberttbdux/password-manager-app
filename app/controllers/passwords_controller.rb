class PasswordsController < ApplicationController

    before_action :authenticate_user!

  def create
    @password = current_user.passwords.new(password_params)

    if @password.save
      redirect_to dashboard_path, notice: "Password saved successfully!"
    else
      redirect_to dashboard_path, alert: "Failed to save password."
    end
  end

  private

  def password_params
    params.require(:password).permit(:service, :email, :password, :url)
  end

end
