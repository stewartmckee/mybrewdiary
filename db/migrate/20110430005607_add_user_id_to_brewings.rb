class AddUserIdToBrewings < ActiveRecord::Migration
  def self.up
    add_column :brewings, :user_id, :integer
  end

  def self.down
    remove_column :brewings, :user_id
  end
end
