class Calendar
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  attr_reader :months
  attr_reader :start_date

  def initialize(start_date, months)
    @start_date = start_date
    @months = months
  end

  def available_dates
    @available_dates ||= Event.all.pluck(:date)
  end

  def show_calendar
    calendars = ActiveSupport::SafeBuffer.new("")
    months.times do |i|
      calendars += create_calendar_month(start_date + i.month)
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

    # Create offset or start days
    if offset > 1
      offset_divs = tag.div "-"
      (offset - 2).times {|i| offset_divs += tag.div "-"}
    end

    # Create all the numbers for that month
    days = ActiveSupport::SafeBuffer.new("")
    (1..days_in_month(year, month)).each do |i|
      text = i.to_s.length > 1 ? i : "0#{i}"
      date = Date.new(year, month, i)

      if event?(date)
        event = Event.find_by(date: date)
        text = text.to_s + event.title.to_s
        days += tag.div text, id: date, style: "background-color: #{event.event_type.colour};", class: class_names(date)
      else
        days += tag.div text, id: date, class: class_names(date)
      end
    end

    calendar_cells = days
    calendar_cells.prepend(offset_divs) if offset > 1
    tag.div class: "calendar-numberContainer" do
      calendar_cells
    end
  end

  private

  def event?(date)
    available_dates.include?(date)
  end

  def days_in_month(year, month)
    days_in_month = (Date.new(year, month, 1) + 1.month - 1.days).strftime("%d").to_i
  end

  def class_names(date)
    classes = ""
    classes += "today" if date == Date.today
    classes += "past" if date < Date.today

    if classes.present?
      classes
    else
      nil
    end
  end
end
