class Store < ActiveRecord::Base
  attr_accessible :name
  belongs_to :group
  has_many :items
end
