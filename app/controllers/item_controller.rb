class ItemController < ApplicationController

  def index
    @products = Product.all
    @product_options = ProductOption.all
  end

  def show_one
    @product = Product.find(params[:id])
    @product_option = ProductOption.find_by(product_id: params[:id])
  end

  def cart
    @items = Item.all
  end

  def add_to_cart
    @item = Item.new
    @item.order_id = @product.id
    @item.product_option_id = @product_option.id
    @item.price = @product_option.price_in_cents
    @item.quantity = params[:quantity]
    session[:order_id] = params[:order_id]
    if @item.save
      redirect_to cart_path
    else
      render "product/show_one"
    end
  end

end
