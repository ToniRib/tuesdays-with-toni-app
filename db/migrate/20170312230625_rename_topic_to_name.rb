class RenameTopicToName < ActiveRecord::Migration[5.0]
  def up
    rename_column :suggested_topics, :topic, :name
  end

  def down
    rename_column :suggested_topics, :name, :topic
  end
end
