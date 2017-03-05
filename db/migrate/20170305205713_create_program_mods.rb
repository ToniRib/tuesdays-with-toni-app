class CreateProgramMods < ActiveRecord::Migration[5.0]
  def change
    create_table :program_mods do |t|
      t.references :program, foreign_key: true
      t.references :mod, foreign_key: true

      t.timestamps
    end
  end
end
