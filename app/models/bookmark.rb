class Bookmark < ActiveRecord::Base
  acts_as_taggable_on :tag 
  belongs_to :domain
  
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https)), :message => "Make sure that you enter a valid URL"
  
  # Strip www from domains, but leave intact any other subdomains
  def to_domain
    domain = URI.parse(url)
    domain.host.gsub(/\Awww\./, '')
  end
  
  def to_s
    url
  end

  def document_title
    @html_document.
  end

  def short_url
    set_if_value_exists(:compressed_url) do
      HTTParty.get("http://tinyurl.com/api-create.php?url=#{url}").parsed_response
    end
  end
  
  private

    def get_url_html_document
      @document = 
    end

    def set_if_value_exists(column, &block)
      if send(column).nil?
        begin
          write_attribute(column, block.call)
          save
          send(column)
        rescue 
          false
        end
      else
        send(column)
      end
    end
    
  
end
