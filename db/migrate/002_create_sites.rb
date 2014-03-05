class CreateSites < ActiveRecord::Migration
  def self.up
    create_table :sites do |t|
      t.string :url
      t.integer :interval
      t.timestamps
    end
  end

  def self.down
    drop_table :sites
  end
end
