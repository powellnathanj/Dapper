class CreateDirectoryServers < ActiveRecord::Migration
  def self.up
    create_table :directory_servers do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :directory_servers
  end
end
