class NotificationMailer < ActionMailer::Base
  default from: 'nobuhito.iguchi@gmail.com'

  def lesson_confirmation(order)
    @order = order
    @tutor = @order.seller
    @student = @order.buyer

    mail(to: @student.user.email, subject: 'Thank you for reserving a lesson at Belluga')
  end
end
