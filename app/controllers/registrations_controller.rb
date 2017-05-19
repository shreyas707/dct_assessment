class RegistrationsController < Devise::RegistrationsController

# WITH THIS, USERS CAN UPDATE ALL INFO EXCEPT PASSWORD WITHOUT PROVIDING CURRENT PASSWORD

	protected

    def update_resource(resource, params)
		if params[:password].blank? && params[:password_confirmation].blank?
			resource.update_without_password(params)
		else
			super
		end
	end

end