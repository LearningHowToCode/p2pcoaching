class NotificationMailer < ActionMailer::Base
  default from: 'pairbis@gmail.com'

  def lesson_confirmation_to_student(order)
    @order = order
    @tutor = @order.seller
    @student = @order.buyer

    mail(to: @student.user.email, subject: 'Your Pairbis lesson (confirmed)')
  end

  def lesson_confirmation_to_tutor(order)
    @order = order
    @tutor = @order.seller
    @student = @order.buyer

    mail(to: @tutor.email, subject: 'Your Pairbis lesson (confirmed)')
  end

  def welcome_tutor(user)
    mail(to: user.email, subject: 'Thank you for signing up for Pairbis!')
  end

  def welcome_student(user)
    mail(to: user.email, subject: 'Thank you for signing up for Pairbis!')
  end
end
