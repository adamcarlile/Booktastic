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
  
  #
  # TODO: Break this out into a libray
  #
  def short_url
    if compressed_url.nil?
      begin
        write_attribute(:compressed_url, HTTParty.get("http://tinyurl.com/api-create.php?url=#{url}").parsed_response)
        save
        return compressed_url
      rescue 
        false
      end
    else
      compressed_url
    end
  end
  
end
