class Domain < ActiveRecord::Base
  has_many :bookmarks
  validates_uniqueness_of :domain
end
