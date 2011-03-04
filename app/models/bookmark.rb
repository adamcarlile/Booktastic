class Bookmark < ActiveRecord::Base
  acts_as_taggable_on :tag 
  belongs_to :domain
  
  validates_presence_of :url
  validates_format_of :url, :with => URI::regexp(%w(http https)), :message => "Make sure that you enter a valid URL"
  
  def to_domain
    # Strip www from domains, but leave intact any other subdomains
    domain = URI.parse(url)
    domain.host.gsub(/\Awww\./, '')
  end
  
  def to_s
    url
  end
  
  def set_tinyurl
  end
  
end
