class AddTinyUrlCacheColumn < ActiveRecord::Migration
  def self.up
    add_column :bookmarks, :compressed_url, :string
  end

  def self.down
    remove_column :bookmarks, :compressed_url
  end
end