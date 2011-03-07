class BookmarksController < ApplicationController
  inherit_resources
  belongs_to :domain, :optional => true
  
  def create
    create!(:notice => "Your bookmark has been saved!"){root_url}
  end
  
  def search
    if params[:query].blank?
      @bookmarks = []
    else
      @bookmarks = Bookmark.search(params[:query])
    end
  end
  

end
