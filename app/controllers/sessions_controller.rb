class SessionsController < ApplicationController
    def new
  end

  def create
    user = User.find_by(name: params[:user])
    if user && user.password == params[:password]
      session[:user] = params[:user]
      redirect_to '/index', notice: '#{user} has successfully logged in.'
    else
      flash.now[:error] = "Incorrect user name or password. Please try again."
      render :new
    end
  end

  def destroy
    session[:user] = nil
    redirect_to '/index', notice: 'You have successfully logged out.'
  end
end
