module TutorsHelper

  def custom_checkbox(object, resource, selected)
    html = <<-HTML
        <div class="checkbox">
          <label>
            #{ check_box_tag "tutor[#{object}][#{resource}]", resource, selected }
            #{resource}
          </label>
        </div>
    HTML

    html.html_safe
  end

  def other_institution_class(tutor)
    if Tutor::INSTITUTIONS.include? tutor.undergraduate_institution
      'hide'
    end
  end

  def selected_institution(tutor)
    if Tutor::INSTITUTIONS.include? tutor.undergraduate_institution
      tutor.undergraduate_institution
    else
      'Other'
    end
  end
end