class NotificationMailer < ActionMailer::Base
  default from: 'p2pcoaching2015@gmail.com', bcc: 'p2pcoaching2015@gmail.com'

  def lesson_confirmation_to_student(order)
    @order = order
    @tutor = @order.seller
    @student = @order.buyer

    mail(to: @student.user.email, subject: 'Your P2P Coaching lesson (confirmed)')
  end

  def lesson_confirmation_to_tutor(order)
    @order = order
    @tutor = @order.seller
    @student = @order.buyer

    mail(to: @tutor.email, subject: 'Your P2P Coaching lesson (confirmed)')
  end

  def welcome_tutor(user)
    mail(to: user.email, subject: 'Thank you for signing up for P2P Coaching!')
  end

  def welcome_student(user)
    mail(to: user.email, subject: 'Thank you for signing up for P2P Coahing!')
  end

  def contact_tutor(tutor, info)
    @tutor = tutor
    @info = info

    mail(to: 'p2pcoaching2015@gmail.com', subject: 'A student has messaged a coach!')
  end

  def contact_us(info)
    @info = info

    mail(to: 'p2pcoaching2015@gmail.com', subject: 'A student has signed up on the ESL page!')
  end

  def remind_review(lesson)
    @lesson  = lesson
    @student = lesson.student
    @tutor   = lesson.tutor

    mail(to: @student.email, subject: 'Please review your coach!')
  end
end
