# frozen_string_literal: true

require "rails_helper"
require "shared_helper"

RSpec.describe "availabilty", type: :request do
  sign_in_admin
  let(:date) { Date.today }
  let(:time) { DateTime.now }

  let(:params) do
    {
      availability: {
        date: date,
        start_time: time,
        finish_time: time + 8.hours
      }
    }
  end

  def expected_values(availability)
    expect(availability.date.strftime("%Y-%m-%d")).to eq date.strftime("%Y-%m-%d")
    expect(availability.start_time.strftime("%H:%M:%S")).to eq time.strftime("%H:%M:%S")
    expect(availability.finish_time.strftime("%H:%M:%S")).to eq (time + 8.hours).strftime("%H:%M:%S")
  end

  describe "GET /admin/availabilities" do
    it "returns 200 response" do
      get admin_availabilities_path
      expect(response.status).to eq 200
    end
  end

  describe "POST /collections" do
    context "with valid params" do
      before do
        post admin_availabilities_path, params: params
      end

      it "create a new collection" do
        expect(response).to redirect_to admin_availabilities_path
        expected_values Availability.last
      end

      it "sets a success flash message" do
        availability = Availability.last
        expect(flash[:success]).to eq "#{availability.date} availability has been created"
      end
    end

    context "with invalid params" do
      let(:params) do
        {
          availability: {
            finish_time: DateTime.now + 8.hours
          }
        }
      end

      it "sets a warning flash message" do
        post admin_availabilities_path, params: params
        expect(flash[:warning]).to eq "An error has occurred please try again"
      end
    end
  end

  describe "GET /admin/availabilities/:id/edit" do
    it "return 200 status response" do
      availability = FactoryBot.create(:availability)
      get edit_admin_availability_path(availability)

      expect(response.status).to eq 200
    end
  end

  describe "PATCH /admin/availability/:id" do
    before do
      availability = FactoryBot.create(:availability, date: Date.tomorrow)
      patch admin_availability_path(availability), params: params
    end

    it "update a availability values" do
      expect(response).to redirect_to admin_availabilities_path
      expected_values Availability.last
    end

    it "sets a success flash message" do
      availability = Availability.last
      expect(flash[:success]).to eq "#{availability.date} availability has been updated"
    end
  end

  describe "DELETE /admin/availabilities/:id" do
    it "removes a availability" do
      availability = FactoryBot.create(:availability)

      delete admin_availability_path(availability)

      expect(Availability.count).to be_zero
      expect(response).to redirect_to admin_availabilities_path
    end
  end
end
