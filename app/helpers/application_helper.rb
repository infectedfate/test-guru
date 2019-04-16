module ApplicationHelper
  def flash_messages
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end.join("\n").html_safe
  end 
end
