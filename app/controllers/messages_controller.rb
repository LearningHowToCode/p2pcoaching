class MessagesController < ApplicationController

  def contact
    tutor = Tutor.find(params[:tutor_id])
    email_info = OpenStruct.new(first_name: params[:first_name],
                                email: params[:email],
                                whom: params[:whom],
                                category: params[:category],
                                message: params[:message])

    NotificationMailer.contact_tutor(tutor, email_info).deliver
    redirect_to message_confirmation_path
  end

  def contact_us
    email_info = OpenStruct.new(first_name: params[:first_name],
                                email: params[:email],
                                category: params[:category],
                                message: params[:message])

    NotificationMailer.contact_us(email_info).deliver
    redirect_to free_lesson_confirmation_path
  end
end
