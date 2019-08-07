namespace :sync do 
  task subjects: [:environment] do 
    Subject.find(conditions: :rss_url) do |subject|
      rss_content = RSS::Parser.parse(subject.rss_url, false)

      rss_content.items.each do |item|
        local_lecture = subject.lectures.where(rss_title: item.title).first_or_initialize

        video_url=item.guid.to_s.delete_prefix('<guid>').delete_suffix('</guid>')

        panopto_url=video_url.sub('Podcast/Syndication/', 'Pages/Viewer.aspx?id=').delete_suffix('.mp4')

        local_lecture.update_attributes(
          video_url: video_url,
          panopto_url: panopto_url,
          pubDate: item.pubDate
          )

          p "Synced lecture: #{item.title}"
      end

      p "Synced subject: #{subject.name}"
    end
  end
end
