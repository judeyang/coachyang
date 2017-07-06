module Admin::SeminarsHelper

  def render_seminar_status(seminar)
    if seminar.is_hidden
      "(Hidden)"
    else
      "(Public)"
    end
  end

end
