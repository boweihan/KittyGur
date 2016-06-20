class SessionsController < ApplicationController
  def new
    if current_user
      flash[:alert] = "Someone is already logged in!"
      redirect_to products_url
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to products_url, notice: "Logged out!"
  end
end
