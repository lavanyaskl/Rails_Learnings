require 'bcrypt'

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_email(params[:email])

    if user && user.password == params[:encrypted_password]
      session[:user_id] = user.id
      flash[:notice] = 'Login Successful'
      redirect_to articles_path
    else
      flash[:error] = 'Please try again!'
      redirect_to action: :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Logout Successful'
    redirect_to action: :new
  end
end
