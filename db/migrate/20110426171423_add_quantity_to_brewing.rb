class AddQuantityToBrewing < ActiveRecord::Migration
  def self.up
    add_column :brewings, :quantity, :integer
  end

  def self.down
    remove_column :brewings, :quantity
  end
end
