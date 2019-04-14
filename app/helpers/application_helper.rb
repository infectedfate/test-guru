module ApplicationHelper
  def flash_message(type, message)
    flash.now[:type] = "#{message}"
  end
    
end
