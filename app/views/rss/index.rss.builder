xml.instruct! :xml, :version => "1.0"
xml.rss(
  "version" => "2.0",
  "xmlns:content" => "http://purl.org/rss/1.0/modules/content/",
  "xmlns:wfw" => "http://wellformedweb.org/CommentAPI/",
  "xmlns:dc" => "http://purl.org/dc/elements/1.1/",
  "xmlns:atom" => "http://www.w3.org/2005/Atom",
  "xmlns:sy" => "http://purl.org/rss/1.0/modules/syndication/",
  "xmlns:slash" => "http://purl.org/rss/1.0/modules/slash/"
) do
  xml.channel do
    xml.title "サイト名"
    xml.description "説明"
    xml.link "サイトURL"
    xml.language "ja-ja"
    xml.ttl "40"
    xml.pubDate(Time.now.strftime("%a, %d %b %Y %H:%M:%S %Z"))
    xml.atom :link, "href" => "RSSのURL", "rel" => "self", "type" => "application/rss+xml"
    @posts.each do |p|
      xml.item do
        xml.title p.title #タイトル
        xml.description do
          xml.cdata! strip_tags(p.content)[0..110] #本文
        end
        xml.pubDate p.created_at #公開日
        xml.guid "http://example.com/#{p.id}"
        xml.link "http://example.com/#{p.id}"
      end
    end
  end
end
