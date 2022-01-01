module ApplicationHelper
  def formatted_date(date)
    date.present? ? date.strftime("%Y-%m-%d") : ""
  end

  def formatted_time(time)
    time.present? ? time.strftime("%H:%M:%S") : ""
  end
end
