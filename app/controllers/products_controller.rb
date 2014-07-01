class ProductsController < ApplicationController

	# home page - display all products
  def index
  	@products = Product.all
  end

  # create a new product
  def new
  	@product = Product.new
  end

  # commit the new product to the database - .save
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  # action to show a product
  def show
    @product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end
  end

  # action to edit a product
  def edit
    @product = Product.find(params[:id])
  end

  # action to delete a product - find it, delete it, redirect to index/products page
  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def update
    @product = Product.find(params[:id])

    if product.update_attributes(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :image_url)
  end
end
