class SessionsController < ApplicationController
  def new
  end
  def create
    #user = User.find_by(email: params[:session][:email].downcase)
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      #redirect_to root_url
      redirect_to params[:referer].present? ? params[:referer] : system_index_path
    else
      render 'new'
    end
  end
  
  def delete
    reset_user_session
    redirect_to session_index_url
  end
  
  def destroy
    log_out if logged_in?
    #redirect_to root_url
  	redirect_to session_index_url
  end
end
