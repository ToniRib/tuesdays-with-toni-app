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
    abbreviation 'BEE'
  end

  factory :mod do
    name 'mod 1'
  end

  factory :program_mod do
    program
    mod
  end

  factory :lesson_recommendation do
    lesson
    program_mod
  end

  factory :voted_lesson_topic do
    topic 'Heroku AddOns'
    vote_count 0
    archived false
  end
end
