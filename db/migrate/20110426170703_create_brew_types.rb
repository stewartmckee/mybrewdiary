class CreateBrewTypes < ActiveRecord::Migration
  def self.up
    create_table :brew_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :brew_types
  end
end
