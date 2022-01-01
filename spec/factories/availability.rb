FactoryBot.define do
  factory :availability do
    date { Date.today }
    start_time { DateTime.now }
    finish_time { DateTime.now + 1.hour }
  end
end
