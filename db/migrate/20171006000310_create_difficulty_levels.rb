class CreateDifficultyLevels < ActiveRecord::Migration[5.1]
  def change
    create_table :difficulty_levels do |t|

      t.timestamps
    end
  end
end
