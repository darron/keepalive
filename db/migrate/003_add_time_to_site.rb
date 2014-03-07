class AddTimeToSite < ActiveRecord::Migration
  def self.up
    change_table :sites do |t|
      t.string :ping_at
    end
  end

  def self.down
    change_table :sites do |t|
      t.string :ping_at
    end
  end
end
