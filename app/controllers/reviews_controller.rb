class ReviewsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  def index #/mountains/:mountain_id/reviews(.:format)
    @mountain = Mountain.find(params[:mountain_id])
    @reviews = @mountain.reviews
  end
  
  def new
    @mountain = Mountain.find(params[:mountain_id])
    @review = Review.new
  end

  def create #/mountains/:mountain_id/reviews(.:format)
    @mountain = Mountain.find(params[:mountain_id])
    @review = Review.new(review_params)
    @review.image.attach(params[:review][:image])
    @review.user_id = current_user.id
    if @review.save
      redirect_to review_path(@review), notice: '投稿に成功しました。'
    else
      @mountain = Mountain.find(params[:mountain_id])
      render :new
    end
  end
  
  
  def show #/reviews/:id(.:format)
    @review = Review.find(params[:id])
  end
  
  def edit #/reviews/:id/edit(.:format)
    @review = Review.find(params[:id])
    if @review.user != current_user
      redirect_to reviews_path, alert: '不正なアクセスです。'
    end
  end

  def update #/reviews/:id(.:format)
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review), notice: '更新に成功しました。'
    else
      @mountain = Mountain.find(params[:mountain_id])
      render :edit
    end
  end

  def destroy #/reviews/:id(.:format)
    @review = Review.find(params[:id])
    @review.destroy
    redirect_back(fallback_location: root_path)
  end
  

  private
  def review_params
    params.require(:review).permit(:mountain_id, :title, :content, :score, :level, :start, :end, :image)
  end
end
