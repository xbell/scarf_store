class SessionsController < ApplicationController

  def log_out
    session.delete(:user_id)
    session.delete(:order_id)
    redirect_to "/", notice: "You have successfully logged out."
  end

  def log_in
    if @current_user
      redirect_to "/", notice: "Please log out before logging in again."
    else
    # find the user by email
    # authenticate that users password matches
      # if it's correct sign them in
      # else they need to try again
      @user = User.find_by(email: params[:email])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/", flash: {success: "You have successfully logged in."}
      else
        redirect_to "/", flash: {warning: "Wrong username/password."}
      end
    end

  end

end
