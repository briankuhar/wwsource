class CreateProjectDifficultyTable < ActiveRecord::Migration[5.1]
  def change
    create_table :project_difficulty_options do |t|
      t.string :difficulty_level
    end
  end
end
