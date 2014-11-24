class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.tutor?
      NotificationMailer.welcome_tutor(resource).deliver
      edit_tutor_path(resource.profile)
    else
      edit_student_path(resource.profile)
    end
  end
end