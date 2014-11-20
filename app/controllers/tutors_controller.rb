class TutorsController < ApplicationController
  before_action :set_tutor, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_user_permissions, only: [:edit, :update, :destroy]
  respond_to :html

  def index
    @tutors = Tutor.all.completed
    respond_with(@tutors)
  end

  def show
    @lessons = @tutor.lessons.where(['day >= ?', Date.today])
    respond_with(@tutor)
  end

  def edit
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
    params.require(:tutor).permit(:name, :image, :format, :price, :bio,
                                  :undergraduate_institution, :undergraduate_major,
                                  :graduate_institution, :graduate_study_field,
                                  :subject, :long_bio, :skype_id, :gmail_address,
                                  :languages)
  end

  def check_user_permissions
    if current_user != @tutor.user
      redirect_to root_url, alert: "Sorry, you cannot edit someone else's profile."
    end
  end
end

