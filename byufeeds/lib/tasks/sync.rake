namespace :sync do
  desc "Get new Feeds"
  task feeds: :environment do
    Feed.all.each do |feed|
      feed.entries.delete_all
    end
    Feed.all.each do |feed|
      content = Feedjira::Feed.fetch_and_parse feed.url
      content.entries.each do |entry|
        local_entry = feed.entries.where(title: entry.title).first_or_initialize
        local_entry.update_attributes(content: entry.content, author: entry.author, url: entry.url, published: entry.published)
        p "Synced Entry - #{entry.title}"
      end
      p "Synced Feed - #{feed.name}"
    end
  end

  desc "Add new feed"
  task feed: :environment do
    # Feed.all.each do |feed|
    #   feed.entries.destroy_all
    # end
    feed = Feed.new
    feed.name = 'Cougarboard Top 10'
    feed.url = 'http://www.cougarboard.com/rss/board.html'
    feed.description = 'Top 10 posts on cougarboard.com'
    feed.save
  end
end
