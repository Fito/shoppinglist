class AddDoneToItem < ActiveRecord::Migration
  def change
    add_column :items, :done, :boolean, :default => false
  end
end
