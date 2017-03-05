class AddAbbreviationToPrograms < ActiveRecord::Migration[5.0]
  def change
    add_column :programs, :abbreviation, :string
  end
end
