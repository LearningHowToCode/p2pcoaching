class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_filter :check_user, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    @tutors = Tutor.all
    respond_with(@tutors)
  end

  def show
    @lessons = @tutor.lessons
    respond_with(@tutor)
  end

  def new
    @tutor = Tutor.new
    respond_with(@tutor)
  end

  def edit
  end

  def create
    @tutor = Tutor.new(tutor_params)
    @tutor.save
    respond_with(@tutor)
  end

  def update
    @tutor.update(tutor_params)
    respond_with(@tutor)
  end

  def destroy
    @tutor.destroy
    respond_with(@tutor)
  end

  private
    def set_tutor
      @tutor = Tutor.find(params[:id])
    end

    def tutor_params
      params.require(:tutor).permit(:name, :format, :university, :price, :bio)
    end

    def check_user
      if current_user != @tutor.user
        redirect_to root_url, alert: "Sorry, you cannot edit someone else's profile."
      end
    end

end

