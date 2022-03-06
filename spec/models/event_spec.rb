# frozen_string_literal: true

require "rails_helper"

RSpec.describe Event, type: :model do
  it { should belong_to(:event_type) }
end
