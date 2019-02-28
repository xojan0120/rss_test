class RssController < ApplicationController
  layout false
  def index
    @posts = Post.all.limit(10)

    @site_url = "http://192.168.33.10:3000/"
    @atom_url = "http://192.168.33.10:3000/feed.atom"
    @site_title = "fss test site"
    @site_description = "RSSのテストサイトです"
    @author = "xojan0120"

    respond_to do |format|
      format.rss
      format.atom
    end
  end
end
