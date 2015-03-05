module ApplicationHelper

  def link_to_my_profile
    if current_user.tutor?
      if current_user.profile.completed_profile?
        link_to 'My Profile', tutor_path(current_user.profile)
      else
        link_to 'My Profile', edit_tutor_path(current_user.profile)
      end
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


  def timezones
    ActiveSupport::TimeZone.us_zones.reverse +
      [ActiveSupport::TimeZone['Tokyo'], ActiveSupport::TimeZone['Beijing']]
  end
end
