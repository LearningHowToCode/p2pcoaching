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
    @lessons = @tutor.lessons.where(['day > ?', Date.today])
    respond_with(@tutor)
  end

  def edit
  end

  def update
    if @tutor.update(normalized_tutor_params)
      @tutor.update_attributes(completed_profile: true)
      redirect_to @tutor
    else
      render :edit
    end
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
    params.require(:tutor).permit(:name, :image, :price, :bio,
                                  :undergraduate_institution, :undergraduate_major,
                                  :graduate_institution, :graduate_study_field,
                                  :subject, :long_bio, :skype_id, :gmail_address,
                                  :languages, :routing_number, :account_number)
  end

  def normalized_tutor_params
    subjects = languages = {}
    attrs = tutor_params

    subjects = params[:tutor][:subjects].values.reject(&:blank?).join(', ') if params[:tutor][:subjects]
    languages = params[:tutor][:languages].values.join(', ') if params[:tutor][:languages]

    if params[:tutor][:undergraduate_institution] == 'Other'
      attrs = attrs.merge(undergraduate_institution: params[:tutor][:other_undergraduate_institution])
    end
    if params[:tutor][:graduate_institution] == 'Other'
      attrs = attrs.merge(graduate_institution: params[:tutor][:other_graduate_institution])
    end

    attrs.merge(subject: subjects).merge(languages: languages)
  end

  def check_user_permissions
    if current_user != @tutor.user
      redirect_to root_url, alert: "Sorry, you cannot edit someone else's profile."
    end
  end
end

