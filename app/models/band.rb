class Band < ActiveRecord::Base
  has_many :albums
  
  validates :name, presence: true
end
