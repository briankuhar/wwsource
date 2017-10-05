class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :youtube
      t.string :facebook
      t.string :twitter
      t.string :instagram
      t.string :website
      t.text :bio
      t.text :contact
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
