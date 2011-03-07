require 'spec_helper'

describe Domain do
  
  before(:each) do
    #Domains can only be created through new bookmarks
    @bookmark = Factory(:bookmark, :url => 'http://bbc.co.uk')
  end
  
  it "Should return an icon image if it exists" do
    @bookmark.domain.icon_url.should == 'http://bbc.co.uk/apple-touch-icon.png'
  end
  
end
