class ChangeTypeToMatlTypeInMaterialsTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :materials, :type, :matl_type
  end
end
