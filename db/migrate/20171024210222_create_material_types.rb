class CreateMaterialTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :material_types do |t|
      t.string :matl_type
      t.timestamps
    end
  end
end
