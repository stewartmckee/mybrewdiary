class CreateReadings < ActiveRecord::Migration
  def self.up
    create_table :readings do |t|
      t.integer :brewing_id
      t.date  :taken_on
      t.float :temperature
      t.integer :specific_gravity
      
      t.timestamps
    end
  end

  def self.down
    drop_table :readings
  end
end
