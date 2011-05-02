class CreateBrewings < ActiveRecord::Migration
  def self.up
    create_table :brewings do |t|
      t.string :name
      t.date :ferment_started_on
      t.date :bottled_on
      t.date :ready_on
      t.text :notes
      t.integer :brew_type_id
      t.string :kit_name

      t.timestamps
    end
  end

  def self.down
    drop_table :brewings
  end
end
