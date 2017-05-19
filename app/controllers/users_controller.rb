class UsersController < ApplicationController

	before_action :set_topic, only: [:show, :edit, :update, :destroy]

	# load_and_authorize_resource

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
		if @user.update_attributes(user_update_parameters)
			redirect_to user_path(@user.id), notice: "Successfully updated"
		else
			render action: "edit"
		end
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end 

	# def upload_avatar
	# 	@user = User.find(params[:user])
	# end

	protected

    def update_resource(resource, params)
		if params[:password].blank? && params[:password_confirmation].blank?
			resource.update_without_password(params)
		else
			super
		end
	end

	private

	def set_topic
		@user = User.find(params[:id])
	end

	def user_parameters
		params.require(:user).permit(:name, :password, :password_confirmation, :avatar, :email, :gender, :dob, :mobile, :role, :student_id, :is_active)
	end

	def user_update_parameters
		params.require(:user).permit(:name, :avatar, :email, :gender, :dob, :mobile, :role, :student_id, :is_active)
	end		

end