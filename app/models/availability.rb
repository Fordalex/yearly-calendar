require 'icalendar'

class Availability < ApplicationRecord

  def create_availabilities(bookings)
    availabilities = bookings.each.map do |booking|
      {
        start_time: booking.dtstart,
        finish_time: booking.dtend,
      }
    end
    Availability.insert_all(availabilities)
  end

  private

  Booking = Struct.new(:date, :duration)

  def self.read_bookings_file
    cal_file = File.open("basic.ics")
    calendars = Icalendar::Calendar.parse(cal_file)
    calendars.first.events.take(5).map do |event|
      puts "start date-time: #{event.dtstart}"
      puts "finsih finish-time: #{event.dtend}"
      puts "description: #{event.description}"
      puts "start date-time timezone: #{event.dtstart.ical_params['tzid']}"
      puts "summary: #{event.summary}"
      puts "########"
    end+
    create_availabilities(bookings)
  end

  def self.make_bookings_file
    # Create a calendar with an event (standard method)
    cal = Icalendar::Calendar.new
    cal.event do |e|
      e.dtstart     = Icalendar::Values::Date.new('20050428')
      e.dtend       = Icalendar::Values::Date.new('20050429')
      e.summary     = "Meeting with the man."
      e.description = "Have a long lunch meeting and decide nothing..."
      e.ip_class    = "PRIVATE"
    end

    cal.publish
    File.write('test.ics', cal.to_ical)

  end
end
