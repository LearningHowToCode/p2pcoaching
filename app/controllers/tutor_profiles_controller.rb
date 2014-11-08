class TutorProfilesController < ApplicationController
  before_action :set_tutor_profile, only: [:show, :edit, :update, :destroy]

  def index
    @tutor_profiles = TutorProfile.all
    respond_with(@tutor_profiles)
  end

  def show
    respond_with(@tutor_profile)
  end

  def new
    @tutor_profile = TutorProfile.new
    respond_with(@tutor_profile)
  end

  def edit
  end

  def create
    @tutor_profile = TutorProfile.new(tutor_profile_params)
    @tutor_profile.save
    respond_with(@tutor_profile)
  end

  def update
    @tutor_profile.update(tutor_profile_params)
    respond_with(@tutor_profile)
  end

  def destroy
    @tutor_profile.destroy
    respond_with(@tutor_profile)
  end

  private
    def set_tutor_profile
      @tutor_profile = TutorProfile.find(params[:id])
    end

    def tutor_profile_params
      params.require(:tutor_profile).permit(:format)
    end
end
