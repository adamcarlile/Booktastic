class RemotePage
  # Spoof user agent in order to get correct HTML Content
  include HTTParty
  headers 'User-Agent' => 'Mozilla/5.0'
  
  attr_accessor :url
  
  def initialize(uri)
    @url = URI.parse(uri)
    @document = parse(@url)
  end
  
  def title
    @document.css('title').text unless @document.css('title').empty?
  end
  
  def summary
    @document.css('meta[name=Description], meta[name=description]').first['content'] unless @document.css('meta[name=Description], meta[name=description]').empty?
  end
  
  private
    
    def parse(url)
      Nokogiri::HTML(HTTParty.get(url.to_s))
    end
  
end