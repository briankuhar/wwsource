class AddYoutubeToProject < ActiveRecord::Migration[5.1]
  def change
    add_column :projects, :youtube_link, :string
  end
end
