 class RegistrationsController < Devise::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:email,:password,:password_confirmation,:remember_me,:name)
  end


  def account_update_params
    params.require(:user).permit(:email,:password,:password_confirmation,:current_password,:remember_me,:name)
  end


end