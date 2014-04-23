# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cohort do
    name "gerry"
    sequence(:start_on){ |n| Date.today +  n.days }
    sequence(:end_on){ |n| Date.today + 3.months + n.days }
  end
end
