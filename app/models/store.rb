class Store < ActiveRecord::Base
  attr_accessible :name
  belongs_to :group
  has_many :items
  
  def group_name
    self.group ? self.group.name : nil
  end
  
  def self.new_for_group(params)
    store = Store.new(params[:store])
    group = Group.find_by_name(params[:group_name])
    store.group_id = group ? group.id : nil
    store
  end
end
