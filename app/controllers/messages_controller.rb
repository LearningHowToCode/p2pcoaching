class MessagesController < ApplicationController

  def contact
    tutor = Tutor.find(params[:tutor_id])
    email_info = OpenStruct.new(first_name: params[:first_name],
                                email: params[:email],
                                whom: params[:whom],
                                category: params[:category],
                                message: params[:message])

    NotificationMailer.contact_tutor(tutor, email_info).deliver
    redirect_to :back, notice: 'Your Message Was Successfully Sent.'
  end

  def contact_us
    email_info = OpenStruct.new(first_name: params[:first_name],
                                email: params[:email],
                                category: params[:category],
                                message: params[:message])

    NotificationMailer.contact_us(email_info).deliver
    redirect_to root_path
  end
end
