# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Destroy existing data
[Bookmark, Tag, Domain].each do |klass|
  klass.destroy_all
end

[ 'http://www.bbc.co.uk/news/world-middle-east-12661270',
  'http://www.bbc.co.uk/news/world-africa-12661409',
  'http://www.bbc.co.uk/news/world-europe-12661446',
  'http://www.bbc.co.uk/news/world-latin-america-12654446',
  'http://www.bbc.co.uk/news/world-europe-12661087'].each do |news_url|
    Factory(:bookmark, :url => news_url)
end

[ 'http://en.wikipedia.org/wiki/Ruby_%28programming_language%29',
  'http://en.wikipedia.org/wiki/Ruby_on_Rails',
  'http://en.wikipedia.org/wiki/Vancouver'].each do |wiki_url|
    Factory(:bookmark, :url => wiki_url, :tag_list => "Wikipedia")
end

[ 'http://37signals.com/svn/posts/2790-on-the-front-lines-in-the-trenches'].each do |signals_url|
  Factory(:bookmark, :url => signals_url, :tag_list => "Ruby, Rails, Business")
end

[ 'http://www.apple.com/ipad/',
  'http://www.apple.com/macbookpro/'].each do |apple_url|
    Factory(:bookmark, :url => apple_url, :tag_list => "Apple, Technology, Business")
end

Bookmark.all.each &:save