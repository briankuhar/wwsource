class DropProjectInstructions < ActiveRecord::Migration[5.1]
  def change
    drop_table :project_instructions
  end
end
