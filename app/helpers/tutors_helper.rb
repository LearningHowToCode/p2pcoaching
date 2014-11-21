module TutorsHelper

  def subject_checkbox(subject)
    html = ""
    html = <<-HTML
        <div class="checkbox">
          <label>
            #{ check_box_tag "tutor[#{subject}]", subject, false }
            #{subject}
          </label>
        </div>
    HTML

    html.html_safe
  end
end