class SessionsController < ApplicationController

	def new
		if session[:user]
			redirect_to main_index_path
		end
		
	end
	
	def create
		if (params[:username] == 'bob' && params['password'] == 'secret')
			session[:user] = 'bob'
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
