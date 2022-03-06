# frozen_string_literal: true

require "rails_helper"

RSpec.describe Calendar, type: :class do
  let(:calendar) { Calendar.new(Date.new(2022, 05, 01), 1) }

  context "when there is an event" do
    it "adds the title to the day cell and sets the background color to the event type colour" do
      event_type = FactoryBot.create(:event_type, name: "Birthday", colour: "#900")
      FactoryBot.create(:event, date: Date.new(2022, 05, 01), title: "Event", event_type: event_type)
      allow(Date).to receive(:today).and_return(Date.new(2022, 04, 01))
      allow_any_instance_of(Calendar).to receive(:days_in_month).and_return(1)

      html_days = '<div class="calendar-numberContainer"><div id="2022-05-01" style="background-color: #900;">01<p>Event</p></div></div>'
      expect(calendar.calendar_numbers(Date.new(2022,05,01))).to eq html_days
    end
  end

  context "when today is present" do
    it "adds the today class to the day cell" do
      allow(Date).to receive(:today).and_return(Date.new(2022, 05, 01))
      allow_any_instance_of(Calendar).to receive(:days_in_month).and_return(1)

      html_days = '<div class="calendar-numberContainer"><div id="2022-05-01" class="today">01</div></div>'
      expect(calendar.calendar_numbers(Date.new(2022, 05, 01))).to eq html_days
    end
  end

  context "when dates are in the past" do
    it "adds the past class to the day cell" do
      allow(Date).to receive(:today).and_return(Date.new(2022, 05, 02))
      allow_any_instance_of(Calendar).to receive(:days_in_month).and_return(1)

      html_days = '<div class="calendar-numberContainer"><div id="2022-05-01" class="past">01</div></div>'
      expect(calendar.calendar_numbers(Date.new(2022, 05, 01))).to eq html_days
    end
  end
end
