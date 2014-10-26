class UsersController < ApplicationController

	def create
		@user = User.new(user_params)
	end

	def update
		user = User.find(params[:id])
		user = User.update_attributes!(user_params)
		redirect_to location
	end


	private

	def user_params
		params.require(:user).permit(:email,:password,:password_confirmation,:remember_me,:name)
	end

end
  #attr_accessible :email, :password, :password_confirmation, :remember_me
