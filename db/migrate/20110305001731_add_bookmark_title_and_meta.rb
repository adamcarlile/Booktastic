class AddBookmarkTitleAndMeta < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :title, :string
    add_column :bookmarks, :description, :text
  end

  def self.down
    remove_column :bookmarks, :description
    remove_column :bookmarks, :title
  end
end