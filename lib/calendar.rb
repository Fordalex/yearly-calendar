class Calendar
  include ActionView::Helpers::TagHelper
  include ActionView::Context

  def show_calendar
    date = Date.today
    create_calendar_month(date)
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
      days = tag.div
      (offset - 2).times {|i| days += tag.div}
      days += tag.div "01"
    else
      days = tag.div "01"
    end

    # Create all the numbers for that month
    (2..days_in_month).each do |i|
      num = i.to_s
      days += tag.div num.length > 1 ? num : "0#{num}"
    end

    tag.div class: "calendar-numberContainer" do
      days
    end
  end
end
