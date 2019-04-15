module ApplicationHelper
  def flash_messages
    flash.map do |type, message|
      content_tag :p, message, class: "flash #{type}"
    end
  end 
end
