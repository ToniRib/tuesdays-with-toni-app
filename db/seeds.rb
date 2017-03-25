class Seed
  BACKEND_COHORTS = %w(1406 1407 1409 1410 1412 1502 1503 1505 1507 1508 1510 1511 1602 1603 1605 1606 1608 1610 1611 1701 1703 1705)
  FRONTEND_COHORTS = %w(1606 1608 1610 1611 1701 1703 1705)

  def self.start
    new.generate
  end

  def generate
    create_programs
    create_cohorts
    create_mods
    create_program_mods
    create_lessons
    schedule_lessons
    add_recommendations
  end

  def create_programs
    @backend = Program.create!(name: 'Back End Engineering', abbreviation: 'BEE')
    @frontend = Program.create!(name: 'Front End Engineering', abbreviation: 'FEE')
  end

  def create_cohorts
    BACKEND_COHORTS.each do |cohort_number|
      Cohort.create!(name: "#{cohort_number} Backend", program: @backend)
    end

    FRONTEND_COHORTS.each do |cohort_number|
      Cohort.create!(name: "#{cohort_number} Frontend", program: @frontend)
    end
  end

  def create_mods
    @mod1 = Mod.create!(name: 'mod 1')
    @mod2 = Mod.create!(name: 'mod 2')
    @mod3 = Mod.create!(name: 'mod 3')
    @mod4 = Mod.create!(name: 'mod 4')
    @alumni = Mod.create!(name: 'alumni')
  end

  def create_program_mods
    @backend.mods << Mod.all
    @frontend.mods << Mod.all
  end

  def create_lessons
    @active_record_lesson = Lesson.create!(
      name: 'ActiveRecord & SQL',
      description: 'The process of constructing a query, both in raw SQL and ActiveRecord.'
    )
    @rspec_lesson = Lesson.create!(
      name: 'Advanced RSpec Testing',
      description: 'Advanced testing in RSpec, including mocks, stubs, doubles, and testing style.'
    )
    @git_lesson = Lesson.create!(
      name: 'Advanced Git',
      description: 'In depth dive into git branching and file collections, advanced git workflow, and style guides. Covers git reset, rebase, cherry-pick, log, remotes, interactive staging, and more!'
    )
    @configuring_environment_lesson = Lesson.create!(
      name: 'Configuring Your Environment',
      description: 'How to update your terminal prompt, save your GitHub username/password, configuring iTerm, set up aliases, and other useful environment tips.'
    )
    @heroku_lesson = Lesson.create!(
      name: 'Heroku',
      description: "An in depth look at Heroku, how it interacts with git, and what it's capable of."
    )
    @week6tbd = Lesson.create!(
      name: 'TBD',
      description: 'Topic decided by the week 6 lesson vote!'
    )
  end

  def schedule_lessons
    ScheduledLesson.create!(lesson: @active_record_lesson, scheduled_date: Date.new(2017, 5, 2))
    ScheduledLesson.create!(lesson: @rspec_lesson, scheduled_date: Date.new(2017, 5, 9))
    ScheduledLesson.create!(lesson: @git_lesson, scheduled_date: Date.new(2017, 5, 16))
    ScheduledLesson.create!(lesson: @configuring_environment_lesson, scheduled_date: Date.new(2017, 5, 23))
    ScheduledLesson.create!(lesson: @heroku_lesson, scheduled_date: Date.new(2017, 5, 30))
    ScheduledLesson.create!(lesson: @week6tbd, scheduled_date: Date.new(2017, 6, 6))
  end

  def add_recommendations
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @backend.id))

    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @backend.id))

    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @frontend.id))

    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @frontend.id))

    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @backend.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @frontend.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @frontend.id))
  end
end

Seed.start
