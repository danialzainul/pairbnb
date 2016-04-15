class UsersController < ApplicationController

	def index
	end
	
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		@user.update(user_params)
		if @user.save
			redirect_to root_path, notice: "Profile updated successfully! :D"
		else
			render :edit
		end
	end

private

def user_params
	params.require(:user).permit(:email, :avatar, :first_name)
end

end
