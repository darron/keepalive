migration 2, :create_sites do
  up do
    create_table :sites do
      column :id, Integer, :serial => true
      column :url, String, :length => 255
      column :interval, Integer
      column :created_at, DateTime
      column :created_on, Date
      column :updated_at, DateTime
      column :updated_on, Date
    end
  end

  down do
    drop_table :sites
  end
end
