class ItemController < ApplicationController

  def cart
    @items = Item.all
  end

  def create
    @item = Item.new
    @item.order_id = Product.id
    @item.product_option_id = ProductOption.product_id
    @item.price = params[:price]
    @item.quantity = params[:quantity]
    session[:order_id] = params[:order_id]
    if @item.save
      redirect_to "/cart"
    else
      render :scarf
    end
  end

end
