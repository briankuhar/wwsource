class CreateMaterials < ActiveRecord::Migration[5.1]
  def change
    create_table :materials do |t|
      t.string :material
      t.string :type
      t.integer :qty
      t.text :notes
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
