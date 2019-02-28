atom_feed(
  language: 'ja-JP',
  root_url: @site_url,
  url:      @atom_url,
  id:       @site_url
) do |feed|
  feed.title    @site_title
  feed.subtitle @site_description
  feed.updated  Time.now
  feed.author { |author| author.name(@author) }

  @posts.each do |entry|
    feed.entry(
      entry,
      url:       "http://example.com/#{entry.id}",
      id:        "http://example.com/#{entry.id}",
      published:  entry.created_at,
      updated:    entry.updated_at
    ) do |item|
      item.title    entry.title 
      item.content  entry.content, :type => 'html' 
      item.author { |author| author.name(@author) }
    end
  end
end
