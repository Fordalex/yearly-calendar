FactoryBot.define do
  factory :administrator do
    date { Date.today }
    start_time { Date.now }
    finish_time { Date.now + 1.hour }
  end
end
