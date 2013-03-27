class SessionsController < ApplicationController

	def new
		if session[:user]
			redirect_to main_index_path
		end
		
	end
	
	def create
		user = User.find_by_username(params[:username])
		
		if (user && params['password'] == user.password)
			session[:user] = user.username
			redirect_to main_index_path
		else
			redirect_to_login 'Wrong login'	
		end
	end
	
	def destroy 
		session[:user] = nil
		redirect_to_login 'Successful log out.'
	end
	
	def redirect_to_login(message)
	  redirect_to login_path, :alert => message
	end
end
