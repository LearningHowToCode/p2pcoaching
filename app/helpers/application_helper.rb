module ApplicationHelper

  def link_to_my_account
    if current_user.tutor?
      link_to 'My Profile', tutor_path(current_user.profile)
    elsif current_user.student?
      link_to 'My Profile', student_path(current_user.profile)
    end
  end

  def link_to_my_schedule
    if current_user.tutor?
      link_to "My Schedule", sales_path
    elsif current_user.student?
      link_to "My Schedule", purchases_path
    end
  end

  def format_time(time)
    time.strftime('%H:%M')
  end
end
