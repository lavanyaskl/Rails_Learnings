class UsersController < ApplicationController
  def new
    # byebug
  end

  def create
    unless params[:email].match('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$')
      flash[:error] = 'Invalid Email'
      redirect_to action: :new and return
    end

    if User.find_by(email: params[:email])
      flash[:error] = 'Email already exists'
      redirect_to action: :new and return
    end

    unless params[:password] == params[:confirm_password]
      flash[:error] = "Password and Confirm Password didn't match"
      redirect_to action: :new and return
    end

    user = User.new(name: params[:name], email: params[:email])
    user.password = params[:password]

    if user.save!
      flash[:notice] = 'User created successfully!!! Please Login to continue.'
      redirect_to controller: :sessions, action: :new
    else
      flash[:error] = 'Sorry, Try Again!'
      redirect_to action: :new
    end
  end
end
