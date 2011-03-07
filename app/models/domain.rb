class Domain < ActiveRecord::Base
  has_many :bookmarks
  validates_uniqueness_of :domain
  
  include Booktastic::ConditionalSet
  
  default_scope :include => :bookmarks, :order => "domains.updated_at DESC"
  
  def to_s
    domain
  end
  
  def icon_url
    set_if_value_does_not_exist(:icon) do
      set_icon_url
    end
  end
  
  def to_param
    "#{id}-#{domain.parameterize}"
  end
  
  
  private
    
    def set_icon_url
      http = HTTParty.get("http://#{domain}/apple-touch-icon.png")
      if http.response.is_a? Net::HTTPNotFound
        icon = "/icons/unknown-icon.png" 
      else
        icon = "http://#{domain}/apple-touch-icon.png"
      end
      return icon
    end
  
end
