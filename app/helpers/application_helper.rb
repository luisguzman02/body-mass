module ApplicationHelper
  def alert_class(flash_type)
    alerts = {
      alert: 'alert-warning',
      notice: 'alert-info',
      error: 'alert-danger'
    }
    alerts[flash_type.to_sym] || "alert-#{flash_type}"
  end
end
