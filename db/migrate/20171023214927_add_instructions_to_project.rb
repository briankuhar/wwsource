class AddInstructionsToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :instructions, :text
  end
end
