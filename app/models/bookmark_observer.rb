class BookmarkObserver < ActiveRecord::Observer
  
  # I think there must be a better way to execute this, bookmark.domain.find_or_create_by_domain is a nill method
  # TODO: Refactor at some point, possibly use create_association()
  def before_save(bookmark)
    domain = Domain.find_or_create_by_domain(:domain => bookmark.to_domain)
    bookmark.domain_id = domain.id
  end
  
end
