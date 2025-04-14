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

  def update
    @password = current_user.passwords.find(params[:id])
    if @password.update(password_params)
      redirect_to dashboard_path, notice: "Password updated successfully!"
    else
      redirect_to dashboard_path, alert: "Failed to update password."
    end
  end

  def destroy
    @password = current_user.passwords.find(params[:id])
    @password.destroy
    redirect_to dashboard_path, notice: "Password deleted."
  end

  private

  def password_params
    params.require(:password).permit(:service, :email, :password)
  end

end
