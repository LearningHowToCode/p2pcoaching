class StudentProfilesController < ApplicationController
  before_action :set_student_profile, only: [:show, :edit, :update, :destroy]

  def index
    @student_profiles = StudentProfile.all
    respond_with(@student_profiles)
  end

  def show
    respond_with(@student_profile)
  end

  def new
    @student_profile = StudentProfile.new
    respond_with(@student_profile)
  end

  def edit
  end

  def create
    @student_profile = StudentProfile.new(student_profile_params)
    @student_profile.save
    respond_with(@student_profile)
  end

  def update
    @student_profile.update(student_profile_params)
    respond_with(@student_profile)
  end

  def destroy
    @student_profile.destroy
    respond_with(@student_profile)
  end

  private
    def set_student_profile
      @student_profile = StudentProfile.find(params[:id])
    end

    def student_profile_params
      params[:student_profile]
    end
end
