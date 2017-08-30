module Admin::SeminarsHelper

  def render_seminar_status(seminar)
    if seminar.is_hidden
      content_tag(:span, "", :class => "fa fa-lock")
      else
        content_tag(:span, "", :class => "fa fa-globe")
      end
  end

end
