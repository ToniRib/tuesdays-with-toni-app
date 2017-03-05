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
    archived false
  end

  factory :cohort do
    name '1510 Backend'
    program
  end

  factory :user do
    first_name 'Toni'
    last_name 'Rib'
    email 'toni@testemail.com'
    username 'tonirib'
    password 'password'
    password_confirmation 'password'
    cohort
  end
end
