class CreateSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :steps do |t|
      t.text :step
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
