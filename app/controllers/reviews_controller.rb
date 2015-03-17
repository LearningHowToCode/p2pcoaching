class ReviewsController < ApplicationController
  respond_to :html
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    @lesson = Lesson.find(params[:lesson_id])
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.lesson_id = params[:lesson_id]
    @review.save
    redirect_to root_path
  end

  def update
    @review.update(review_params)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:review, :rating)
    end
    
end
