class ReviewsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @review = Rating.create(
      :user_id => @user.id,
      :product_id => params[:product_id],
      :rating => params[:rating][:rating],
      :description => params[:rating][:description]
    )
    if @review.save
      redirect_to :back
    else
      redirect_to '/'
    end
  end

  def destroy
    @review = Rating.find(params[:id])
    if @review
      puts "REVIEWWW"
      puts @review
      @review.destroy
    end
    redirect_to "/products/#{params[:product_id]}"
  end
end

