class AddStateToBrewings < ActiveRecord::Migration
  def self.up
    add_column :brewings, :state, :string
  end

  def self.down
    remove_column :brewings, :state
  end
end
