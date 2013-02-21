class Item < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :store
  belongs_to :group
  
  def store_name
    self.store ? self.store.name : nil
  end
  
  def self.new_for_store(params)
    store = Store.find_by_name(params[:store_name])
    item = Item.new(params[:item])
    item.store_id = store ? store.id : nil
    item
  end
end
