class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_current_user

  def set_current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end
  end

  def current_order
    if session[:cart_id]
      Order.find(sessions[:cart_id])
    else
      o = Order.create
      session[:cart_id] = o.id
      # REVIEW: This may cause problems because this line doesn't return
      #         the newly created order, you may want to end this else
      #         with the order object `o`
    end
  end

end
