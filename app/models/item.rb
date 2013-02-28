class Item < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :store
  belongs_to :group
  
  def store_name
    self.store ? self.store.name : nil
  end
  
  def self.new_for_group(params)
    item = Item.new(params[:item])
    if params[:store_name]
      store = Store.find_by_name(params[:store_name])
      item.store_id = store ? store.id : nil
      item.group_id = store && store.group ? store.group.id : nil
    elsif params[:group_name]
      group = Group.find_by_name(params[:group_name])
      item.group_id = group ? group.id : nil
    end

    item
  end
end
