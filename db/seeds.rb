class Seed
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
    create_suggested_topics
    create_users
    let_users_vote_on_topics
  end

  def create_programs
    @back_end = Program.create!(name: 'Back End Engineering', abbreviation: 'BEE')
    @front_end = Program.create!(name: 'Front End Engineering', abbreviation: 'FEE')
  end

  def create_cohorts
    @backend_1610 = Cohort.create!(name: '1610 Backend', program: @back_end)
    @backend_1611 = Cohort.create!(name: '1611 Backend', program: @back_end)
    @backend_1701 = Cohort.create!(name: '1701 Backend', program: @back_end)
    @backend_1703 = Cohort.create!(name: '1703 Backend', program: @back_end)
    @frontend_1610 = Cohort.create!(name: '1610 Frontend', program: @front_end)
    @frontend_1611 = Cohort.create!(name: '1611 Frontend', program: @front_end)
    @frontend_1701 = Cohort.create!(name: '1701 Frontend', program: @front_end)
    @frontend_1703 = Cohort.create!(name: '1703 Frontend', program: @front_end)
  end

  def create_mods
    @mod1 = Mod.create!(name: 'mod 1')
    @mod2 = Mod.create!(name: 'mod 2')
    @mod3 = Mod.create!(name: 'mod 3')
    @mod4 = Mod.create!(name: 'mod 4')
  end

  def create_program_mods
    @back_end.mods << Mod.all
    @front_end.mods << Mod.all
  end

  def create_lessons
    @active_record_lesson = Lesson.create!(name: 'ActiveRecord and SQL', description: 'The process of constructing a query, both in raw SQL and ActiveRecord.')
    @rspec_lesson = Lesson.create!(name: 'Advanced RSpec Testing', description: 'Advanced testing in RSpec, including mocks, stubs, doubles, and testing style.')
    @git_lesson = Lesson.create!(name: 'Advanced Git', description: 'In depth dive into git, advanced git workflow, and style guides.')
    @configuring_environment_lesson = Lesson.create!(name: 'Configuring Your Environment', description: 'How to update your terminal prompt, save your GitHub password, and configuring iTerm.')
    @heroku_lesson = Lesson.create!(name: 'Heroku', description: "A more in depth look at Heroku, how it interacts with git, and what it's capable of.")
  end

  def schedule_lessons
    ScheduledLesson.create!(lesson: @active_record_lesson, scheduled_date: Date.today - 3.days)
    ScheduledLesson.create!(lesson: @rspec_lesson, scheduled_date: Date.today + 2.days)
    ScheduledLesson.create!(lesson: @git_lesson, scheduled_date: Date.today + 9.days)
    ScheduledLesson.create!(lesson: @configuring_environment_lesson, scheduled_date: Date.today + 16.days)
    ScheduledLesson.create!(lesson: @heroku_lesson, scheduled_date: Date.today + 22.days)
  end

  def add_recommendations
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @active_record_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @back_end.id))

    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @rspec_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @back_end.id))

    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @git_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @front_end.id))

    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod1.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @configuring_environment_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @front_end.id))

    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @back_end.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod2.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod3.id, program_id: @front_end.id))
    LessonRecommendation.create!(lesson: @heroku_lesson, program_mod: ProgramMod.find_by(mod_id: @mod4.id, program_id: @front_end.id))
  end

  def create_suggested_topics
    @capybara = SuggestedTopic.create!(name: 'Capybara Feature Testing')
    @jses6 = SuggestedTopic.create!(name: 'JavaScript ES6')
  end

  def create_users
    @toni = User.create!(first_name: 'Toni', last_name: 'Rib', username: 'tonirib', email: 'toni@test.com', password: 'password', password_confirmation: 'password', cohort: @backend_1610)
    @dan = User.create!(first_name: 'Dan', last_name: 'Rib', username: 'danrib', email: 'dan@test.com', password: 'password', password_confirmation: 'password', cohort: @frontend_1701)
  end

  def let_users_vote_on_topics
    UserVote.create!(user: @toni, suggested_topic: @jses6)
    UserVote.create!(user: @dan, suggested_topic: @jses6)
    UserVote.create!(user: @dan, suggested_topic: @capybara)
  end
end

Seed.start
