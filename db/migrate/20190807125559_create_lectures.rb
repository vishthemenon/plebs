class CreateLectures < ActiveRecord::Migration[6.0]
  def change
    create_table :lectures do |t|
      t.string :title
      t.string :rss_title
      t.string :video_url
      t.string :panopto_url
      t.datetime :pubDate
      t.references :subject, null: false, foreign_key: true

      t.timestamps
    end
  end
end
