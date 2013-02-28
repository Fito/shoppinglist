class Group < ActiveRecord::Base
  attr_accessible :name
  has_many :stores
  has_many :items
  
  def has_stores?
    !self.stores.empty?
  end  
  
end
