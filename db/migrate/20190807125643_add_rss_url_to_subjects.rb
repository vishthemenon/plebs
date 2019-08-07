class AddRssUrlToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :rss_url, :string
  end
end
