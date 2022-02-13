class Calendar
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def available_dates
    @available_dates ||= Event.all.pluck(:date)
  end

  def show_calendar
    date = Date.new(2022, 01, 01)
    calendars = ActiveSupport::SafeBuffer.new("")
    12.times do |i|
      calendars += create_calendar_month(date + i.month)
    end
    calendars
  end

  def create_calendar_month(date)

    tag.div class: "calendar-monthContainer" do
      calendar_title(date) + calendar_table(date)
    end
  end

  def calendar_title(date)
    tag.h2 "#{date.strftime("%B")} #{date.strftime("%Y")}", class: "calendar-title"
  end

  def calendar_table(date)
    header_days_row = tag.tr
    monday_date = Date.new(2021, 12, 20)

    7.times do |i|
      current_date = monday_date + i.days
      header_days_row += tag.div "#{current_date.strftime("%A")[0..2]}", class: "calendar-days"
    end
    tag.div class: "calendar-dates" do
      header_days_row + calendar_numbers(date)
    end
  end

  def calendar_numbers(date)
    month = date.month
    year = date.year
    offset = Date.new(year, month, 1).strftime("%w").to_i
    days_in_month = (Date.new(year, month, 1) + 1.month - 1.days).strftime("%d").to_i

    # Create offset or start days
    if offset > 1
      offset_divs = tag.div "-"
      (offset - 2).times {|i| offset_divs += tag.div "-"}
    end

    # Create all the numbers for that month
    days = ActiveSupport::SafeBuffer.new("")
    (1..days_in_month).each do |i|
      num = i.to_s.length > 1 ? i : "0#{i}"
      date = Date.new(year, month, i)
      days += tag.div num, id: date, class: date_available(date)
    end

    calendar_cells = days
    calendar_cells.prepend(offset_divs) if offset > 1
    tag.div class: "calendar-numberContainer" do
      calendar_cells
    end
  end

  private

  def date_available(date)
    available_dates.include?(date) ? "available" : ""
  end
end
