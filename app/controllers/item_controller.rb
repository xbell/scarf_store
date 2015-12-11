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
    product_option = ProductOption.find_by(product_id: params[:id])
    @item = Item.find_by(product_option_id: product_option.id)
    if @item != nil
      @item.quantity += 1
    else
      @item = Item.new
      @item.order_id = nil
      @item.product_option_id = product_option.id
      @item.price = product_option.price_in_cents
      @item.quantity = 1
    end
      # session[:order_id] = params[:order_id]
    if @item.save
      redirect_to cart_path
    else
      render "product/show_one"
    end
  end

  def update_cart

  end

  def delete_item
    @product_option = ProductOption.find(params[:id])
    @product = Product.find(@product_option.product_id)
    product_name = @product.name
    @item = Item.find_by(product_option_id: @product_option.id)
    @item.destroy
    redirect_to "/cart", notice: "#{product_name} have been deleted."
  end

end
