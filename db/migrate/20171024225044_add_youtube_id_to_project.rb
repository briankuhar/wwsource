class AddYoutubeIdToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :youtube_id, :string
  end
end
