class Lecture < ApplicationRecord
  belongs_to :subject

  validates :rss_title, presence: true
  validates :video_url, presence: true
  validates :panopto_url, presence: true
  validates :pubDate, presence: true
end
