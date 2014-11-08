class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.all
    respond_with(@sessions)
  end

  def show
    respond_with(@session)
  end

  def new
    @session = Session.new
    respond_with(@session)
  end

  def edit
  end

  def create
    @session = Session.new(session_params)
    @session.save
    respond_with(@session)
  end

  def update
    @session.update(session_params)
    respond_with(@session)
  end

  def destroy
    @session.destroy
    respond_with(@session)
  end

  private
    def set_session
      @session = Session.find(params[:id])
    end

    def session_params
      params.require(:session).permit(:day, :start_time, :end_time, :status, :tutor_id, :student_id)
    end
end
