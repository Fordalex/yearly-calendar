module ApplicationHelper
  def formatted_date(date)
    date.strftime("%Y-%m-%d")
  end

  def formatted_time(time)
    time.strftime("%H:%M:%S")
  end
end
