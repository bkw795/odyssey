module ApplicationHelper

  def full_title(page_title = '')
    base_title = "Odyssey"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type] || "alert-#{flash_type.to_s}"
  end

  def flash_messages
    flash_div = ""
    flash.each do |msg_type, message|
      flash_div += "<div class='alert #{bootstrap_class_for(msg_type.to_sym)}'>"
      flash_div += content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
      if message.respond_to?(:each)
        flash_div += "<ul>"
        message.each do |msg|
          flash_div += "<li>#{msg}</li>"
        end
        flash_div += "</ul>"
      else
        flash_div += message
      end
      flash_div += "</div>"
    end
    flash_div.html_safe
  end

end
