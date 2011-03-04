class RemotePage
  
  attr_accessor :url, :document
  
  def initialize(uri)
    @url = URI.parse(uri)
    @document = parse(@url)
  end
  
  def title
    @document.css('title').text
  end
  
  def summary
    @document.css('meta[name=description]').first['content']
  end
  
  private
    
    def parse(url)
      Nokogiri::HTML(HTTParty.get(url.to_s))
    end
  
end