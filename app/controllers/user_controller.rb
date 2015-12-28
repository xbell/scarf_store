class UserController < ApplicationController

  def create
    @users = User.all
    @users.each do |user|
      if user.email == params[:email]
        redirect_to "/signup", notice: "You have already signed up. Please log in."
        return # REVIEW: This return is not needed
      end
    end
    @email = params[:email]
    if params[:password] != params[:password_confirmation]
      flash.now[:notice] = "Passwords do not match."
      render "product/signup"
    else
      @user = User.new
      @user.email = params[:email]
      @user.password = params[:password]
      if @user.save
        session[:user_id] = @user.id
        redirect_to "/scarves", notice: "You have successfully signed up!"
      else
        render "product/signup"
      end
    end
  end

end
