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

  def other_graduate_institution_class(tutor)
    if Tutor::INSTITUTIONS.include? tutor.graduate_institution
      'hide'
    end
  end

  def other_subject_class(tutor)
    other_subject = Subject.find_by_name('Other')

    unless tutor.subjects.try(:include?, other_subject)
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

  def selected_graduate_institution(tutor)
    if Tutor::INSTITUTIONS.include? tutor.graduate_institution
      tutor.graduate_institution
    else
      'Other'
    end
  end

  def price_button(from, to)
    content_tag(:div, class: 'btn-link',
                data: { selector: 'price-filter', from: from, to: to }) do
      "#{number_to_currency from} - #{number_to_currency to}"
    end
  end

  def tutor_rating(tutor)
    tutor.rating ? tutor.rating.to_i : t(:not_rated)
  end
end
