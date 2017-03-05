class Program < ApplicationRecord
  has_many :program_mods
  has_many :mods, through: :program_mods
  has_many :cohorts
end
