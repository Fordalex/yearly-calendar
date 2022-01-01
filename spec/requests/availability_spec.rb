# frozen_string_literal: true

require "rails_helper"
require "shared_helper"

RSpec.describe "availabilty", type: :request do
  sign_in_admin

  let(:params) {
    {
      date: Date.today,
      start_time: Date.now,
      finish_time: Date.now + 8.hours
    }
  }

  def expected_fields(availability)
    expect(availability.date).to eq Date.today
    expect(availability.start_time).to eq Date.now
    expect(availability.finish_time).to eq Date.now + 8.hours
  end

  describe "GET /admin/availabilities" do
    it "returns 200 response" do
      get admin_availabilities_path
      expect(reponse.status).to eq 200
    end
  end
end
