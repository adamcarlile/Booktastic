class BookmarkObserver < ActiveRecord::Observer
  
  # I think there must be a better way to execute this, bookmark.domain.find_or_create_by_domain is a nill method
  # TODO: Refactor at some point, possibly use create_association()
  def before_save(bookmark)
    create_domain_relationship(bookmark)
    get_html_attributes(bookmark)
  end
  
  private
    
    # TODO: Add a begin rescue block here
    def get_html_attributes(bookmark)
      @document = RemotePage.new(bookmark.url)
      bookmark.title = @document.title
      bookmark.description = @document.summary
    end
  
    def create_domain_relationship(bookmark)
      domain = Domain.find_or_create_by_domain(:domain => bookmark.to_domain)
      domain.touch
      bookmark.domain_id = domain.id
    end
  
end
