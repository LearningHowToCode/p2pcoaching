class ReviewsController < ApplicationController
  respond_to :html
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  rescue_from('ActiveRecord::RecordNotFound'){ |e| redirect_to root_path, notice: e.message }

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

    # TODO use authorization solution
    return redirect_to(root_path, notice: t(:unauthorized) ) if unauthorized_user

    respond_with(@review)
  end

  def edit
    # TODO use authorization solution
    @lesson = @review.lesson
    return redirect_to(root_path, notice: t(:unauthorized) ) if unauthorized_user
  end

  def create
    @review = Review.new(review_params)
    @review.lesson_id = params[:lesson_id]

    # TODO use authorization solution
    @lesson = @review.lesson
    return redirect_to(root_path, notice: t(:unauthorized) ) if unauthorized_user

    @review.save
    redirect_to root_path
  end

  def update

    # TODO use authorization solution
    @lesson = @review.lesson
    return redirect_to(root_path, notice: t(:unauthorized) ) if unauthorized_user

    @review.update(review_params)
    redirect_to root_path
  end

  def destroy
    # TODO use authorization solution
    @lesson = @review.lesson
    return redirect_to(root_path, notice: t(:unauthorized) ) if unauthorized_user

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

    # TODO use authorization solution
    def unauthorized_user
      !current_user || @lesson.student != current_user.profile
    end
    
end
