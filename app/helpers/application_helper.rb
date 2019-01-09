module ApplicationHelper
  BOOTSTRAP_FLASH_CLASSES = {
    success: 'alert-success',
    error: 'alert-danger',
    alert: 'alert-warning',
    notice: 'alert-info'
  }.freeze

  def bootstrap_class_for(flash_type)
    BOOTSTRAP_FLASH_CLASSES.fetch(flash_type.to_sym, flash_type.to_s)
  end

  def flash_messages
    flash
  end

end
