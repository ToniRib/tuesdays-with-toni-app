class Cohort < ApplicationRecord
  belongs_to :program
  has_many :users
end
