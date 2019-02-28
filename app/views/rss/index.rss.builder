xml.instruct! :xml, version: "1.0"
xml.rss(
   version:        "2.0",
  "xmlns:content": "http://purl.org/rss/1.0/modules/content/",
  "xmlns:wfw":     "http://wellformedweb.org/CommentAPI/",
  "xmlns:dc":      "http://purl.org/dc/elements/1.1/",
  "xmlns:atom":    "http://www.w3.org/2005/Atom",
  "xmlns:sy":      "http://purl.org/rss/1.0/modules/syndication/",
  "xmlns:slash":   "http://purl.org/rss/1.0/modules/slash/"
) do
  xml.channel do
    xml.title       @site_title
    xml.description @site_description
    xml.link        @site_url
    xml.language    "ja-ja"
    xml.ttl         "40"
    xml.pubDate      Time.now.strftime("%a, %d %b %Y %H:%M:%S %Z") 
    xml.atom        :link, href: @atom_url, rel: "self", type: "application/rss+xml"

    @posts.each do |entry|
      xml.item do
        xml.title        entry.title
        xml.link        "http://example.com/#{entry.id}"
        xml.guid        "http://example.com/#{entry.id}"
        xml.description  entry.content
        xml.pubDate      entry.created_at.to_formatted_s(:rfc822)
        xml.dc :creator, @author
      end
    end
  end
end
