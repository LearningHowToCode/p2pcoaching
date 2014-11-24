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
end