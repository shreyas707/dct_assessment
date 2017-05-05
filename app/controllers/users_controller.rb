class UsersController < ApplicationController

	before_action :set_topic, only: [:show, :edit, :update, :destroy]

	load_and_authorize_resource

	def index
		@users = User.all
	end

	def show
	end

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_parameters)
		if @user.save
			redirect_to users_path
		else
			render action: "new"
		end
	end

	def update
		if @user.update_attributes(user_parameters)
			redirect_to edit_user_registration_path, notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end 

	def upload_avatar
		@user = User.find(params[:user])
	end

	private

	def set_topic
		@user = User.find(params[:id])
	end

	def user_parameters
		params.require(:user).permit(:name, :avatar, :email, :password, :password_confirmation, :mobile, :role, :student_id, :is_active)
	end

end