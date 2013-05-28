class SessionsController < ApplicationController

	def new
		if session[:user]
			redirect_to main_index_path
		end
		
	end
	
	def create
 		user = User.authenticate(params[:username], params[:password])
		if (user)
 			session[:user] = user.id
 			user.last_login = Time.now
 			puts "basssza" unless user.update_attribute('last_login', Time.now)
 			I18n.locale = user.language
 			redirect_to main_index_path
 		else
 			redirect_to_login 'Login failed.'	
		end
	end
	
	def destroy 
		session[:user] = nil
		redirect_to login_path, :notice => 'Successful log out.'
	end
	
	def show_forgot_password
	  
	end
	
	def send_forgot_password
	  UserMailer.reset_password(params[:email]).deliver
	  redirect_to(login_path(), :notice => 'Email sent.')
	end
	
	def redirect_to_login(message)
	  redirect_to login_path, :alert => message
	end
end
