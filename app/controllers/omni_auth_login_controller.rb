class OmniAuthLoginController < ApplicationController
	def index
		if current_user
			redirect_to projects_path
		end
  	end
	def create
	    auth = request.env["omniauth.auth"]
	    user = User.find_or_create_with_omniauth(auth)
	    session[:user_id] = user.id
		redirect_to projects_path
	end

	def failure
		redirect_to root_url
	end

	def destroy
		session.delete(:user_id)
		render action: "index"
	end
end
