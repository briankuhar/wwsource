class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.text :project_description
      t.string :project_difficulty
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
