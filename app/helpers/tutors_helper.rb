module TutorsHelper

  def custom_checkbox(resource)
    html = <<-HTML
        <div class="checkbox">
          <label>
            #{ check_box_tag "tutor[#{resource}]", resource, false }
            #{resource}
          </label>
        </div>
    HTML

    html.html_safe
  end
end