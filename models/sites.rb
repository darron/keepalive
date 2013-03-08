class Sites
  include DataMapper::Resource

  # property <name>, <type>
  property :id, Serial
  property :url, String
  property :interval, Integer
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date
  
  validates_presence_of :url, :interval
end
