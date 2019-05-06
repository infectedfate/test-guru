module ApplicationHelper
  FLASH_TYPES = {
    alert: 'warning',
    notice: 'info'
  }.freeze

  def flash_messages
    flash.map do |type, message|
      content_tag :flash_type, message, class: "flash #{type}"
    end.join("\n").html_safe
  end 

  private

  def flash_type(type)
    "alert alert-#{FLASH_TYPES[type.to_sym]}"
  end
end
