class StudentsController < ApplicationController
  before_action :set_student
  before_action :authenticate_user!
  respond_to :html

  def show
    respond_with(@student)
  end

  def edit
  end

  def update
    @student.update(student_params)
    respond_with(@student)
  end

  def destroy
    @student.destroy
    respond_with(@student)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def student_params
      params.require(:student).permit(:name, :country, :skype_id, :gmail_address,
                                      :preference)
    end
end
