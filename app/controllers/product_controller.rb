class ProductController < ApplicationController

  def index

  end

  def account

  end

  def show_all
    @products = Product.all
  end

  # def show_product_opt
  #   @product_option = ProductOption.new
  #   @product_option.name = params[:name]
  #   @product_option.price_in_cents = params[:price_in_cents]
  #   @product_option.product_id = params[:id]
  #   @product_option.save
  # end

  def show_one
    @product = Product.find(params[:id])
    @product_option = ProductOption.find_by(product_id: params[:id])
  end

  def cart
   @items = Item.all
  end

  def signup

  end

end
