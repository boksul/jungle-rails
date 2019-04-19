class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    if current_user
      @user = User.find(session[:user_id])
    end
    @user = User.find(session[:user_id])
    @product = Product.find params[:id]
    @product_review = @product.rating
    @review = Rating.new
  end
end
