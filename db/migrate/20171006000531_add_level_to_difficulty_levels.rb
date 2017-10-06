class AddLevelToDifficultyLevels < ActiveRecord::Migration[5.1]
  def change
    add_column :difficulty_levels, :level, :string
  end
end
