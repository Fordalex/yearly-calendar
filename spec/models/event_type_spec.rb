# frozen_string_literal: true

require "rails_helper"

RSpec.describe EventType, type: :model do
  it { should have_many(:events) }
end
