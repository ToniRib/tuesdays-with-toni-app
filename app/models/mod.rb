class Mod < ApplicationRecord
  has_many :program_mods
  has_many :programs, through: :program_mods
end
