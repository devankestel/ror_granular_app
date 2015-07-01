class UsersController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:user])

    if user
      if user.password == params[:password]
        session[:user] = params[:user]
        redirect_to restaurants_url, notice: "Thanks for signing in to the Iron Yelp, #{params[:user]}"
      end
    end
  end

  def destroy
    session[:user] = nil
    redirect_to restaurants_url
  end

end
