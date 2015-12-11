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
    @product = Product.new
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    if @product.save
      @product_option = ProductOption.new
      @product_option.name = params[:type]
      @product_option.price_in_cents = params[:price_in_cents]
      @product_option.product_id = @product.id
      if @product_option.save
        redirect_to "/products", notice: "#{@product.name} has been created!"
      else
        @product.destroy
        @products = Product.all
        @product_options = ProductOption.all
        flash.now[:notice] = "Error creating product, please fill in all fields."
        render :index
      end
    else
      @products = Product.all
      @product_options = ProductOption.all
      flash.now[:notice] = "Error creating product, please fill in all fields."
      render :index
    end
  end

  def edit
    @product = Product.find(params[:id])
    @product_option = ProductOption.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.name = params[:name]
    @product.description = params[:description]
    @product.image_url = params[:image_url]
    if @product.save
      @product_option = ProductOption.find_by(product_id: params[:id])
      @product_option.name = params[:type]
      @product_option.price_in_cents = params[:price_in_cents]
      if @product_option.save
        redirect_to "/products", notice: "#{@product.name} has been updated!"
      else
        @product = Product.find(params[:id])
        @product_option = ProductOption.find_by(product_id: params[:id])
        @products = Product.all
        @product_options = ProductOption.all
        flash.now[:notice] = "Error updating product."
        render :show_one
      end
    else
      @product = Product.find(params[:id])
      @product_option = ProductOption.find_by(product_id: params[:id])
      @products = Product.all
      @product_options = ProductOption.all
      flash.now[:notice] = "Error updating product."
      render :show_one
    end
  end

  def delete
    @product_option = ProductOption.find_by(product_id: params[:id])
    @product = Product.find(params[:id])
    product_name = @product.name
    @product_option.destroy
    @product.destroy
    redirect_to "/products", notice: "#{product_name} has been deleted!"
  end


end
