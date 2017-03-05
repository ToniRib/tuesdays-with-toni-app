FactoryGirl.define do
  factory :lesson do
    name 'Advanced Git'
    description 'How to avoid gitastrophes'
  end

  factory :lesson_date do
    lesson
    scheduled_date Time.now + 7.days
  end

  factory :program do
    name 'Back End Engineering'
  end
end
