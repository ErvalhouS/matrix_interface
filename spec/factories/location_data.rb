# This will guess the LocationData class
FactoryBot.define do
  factory :location_data do
    source { %w[sentinels sniffers loopholes].sample }
    start_node { %w[alpha beta gamma delta theta lambda tau psi omega].sample }
    end_node { %w[alpha beta gamma delta theta lambda tau psi omega].sample }
    start_time { (1.year.ago.to_date..364.days.from_now.to_date).to_a.sample.beginning_of_day }
    end_time { (1.year.from_now.to_date..2.years.from_now.to_date).to_a.sample.beginning_of_day }

    trait :with_pass do
      pass { create(:pass) }
    end
  end
end
