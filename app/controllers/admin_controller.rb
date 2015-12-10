class AdminController < ApplicationController

  def index
    @products = Product.all
    @product_options = ProductOption.all
  end

  def show_one
    @product = Product.find(params[:id])
    @product_option = ProductOption.find_by(product_id: params[:id])
  end

  def add_product
    @add_product = Product.new
    @add_product.name = params[:name]
    @add_product.description = params[:description]
    @add_product.image_url = params[:image_url]
    if @add_product.save
      @add_product_option = ProductOption.new
      @add_product_option.name = params[:type]
      @add_product_option.price_in_cents = params[:price_in_cents]
      @add_product_option.product_id = @add_product.id
      if @add_product_option.save
        redirect_to "/products"
      else
        @add_product.destroy
        @add_products = Product.all
        @add_product_options = ProductOptions.all
        render :index
      end
    else
      @add_products = Product.all
      # @add_product_options = ProductOptions.all
      render :index
    end
  end

  # def add_product_option
  #   @add_product_option = ProductOption.new
  #   @add_product_option.name = params[:name]
  #   @add_product_option.price_in_cents = params[:price_in_cents]
  #   @add_product_option.product_id = Product.where(id: params[:product_id])
  #   if @add_product_option.save
  #     redirect_to "/products"
  #   else
  #     @add_product_options = ProductOption.all
  #     render :index
  #   end
  # end

  def edit
    @product = Product.find(params[:id])
    @product_option = ProductOption.find(params[:id])
  end

  def update
    @add_product = Product.find(params[:id])
    @add_product.name = params[:name]
    @add_product.description = params[:description]
    @add_product.image_url = params[:image_url]
    if @add_product.save
      @add_product_option = ProductOption.find_by(product_id: params[:id])
      @add_product_option.name = params[:type]
      @add_product_option.price_in_cents = params[:price_in_cents]
      # @add_product_option.product_id = @product.id
      if @add_product_option.save
        redirect_to "/products"
      else
        @add_product.destroy
        @add_products = Product.all
        @add_product_options = ProductOptions.all
        render :product_edit
      end
    else
      @products = Product.all
      @product_options = ProductOptions.all
      render :index
    end
  end

  def delete
    @product_option = ProductOption.find_by(product_id: params[:id])
    @product = Product.find(params[:id])
    @product_option.destroy
    @product.destroy
    redirect_to "/products"
  end


end
