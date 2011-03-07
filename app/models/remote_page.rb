class RemotePage
  # Spoof user agent in order to get correct HTML Content
  include HTTParty
  headers 'User-Agent' => 'Mozilla/5.0'
  
  attr_accessor :url, :document
  
  def initialize(uri)
    @url = URI.parse(uri)
    @document = parse(@url)
  end
  
  def title
    @document.css('title').text unless @document.css('title').empty?
  end
  
  def summary
    if @document.css('meta[name=Description], meta[name=description]').blank?
      @document.css('p').first.text
    else
      @document.css('meta[name=Description], meta[name=description]').first['content']
    end
  end
  
  private
    
    def parse(url)
      Nokogiri::HTML(HTTParty.get(url.to_s))
    end
  
end