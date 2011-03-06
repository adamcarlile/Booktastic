class AddIconToDomain < ActiveRecord::Migration
  def self.up
    add_column :domains, :icon, :string
  end

  def self.down
    remove_column :domains, :icon
  end
end