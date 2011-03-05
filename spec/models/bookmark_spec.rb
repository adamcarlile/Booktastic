require 'spec_helper'

describe Bookmark do
  
  before(:each) do
    @bookmark = Factory(:bookmark, :url => 'http://bbc.co.uk')
  end
  
  it "Should shortern the url" do
    @bookmark.short_url.should == 'http://tinyurl.com/ocix'
  end
  
  it "Should return the title tag from the url" do
    @bookmark.document_title.should == 'BBC - Homepage'
  end
  
  it "Should return the meta data from the url" do
    @bookmark.document_description.should == 'Breaking news, sport, TV, radio and a whole lot more. The BBC informs, educates and entertains - wherever you are, whatever your age.'
  end
  
end
