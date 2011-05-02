class AlterTypesOnReadings < ActiveRecord::Migration
  def self.up
    change_table :readings do |t|
      t.change :taken_on, :datetime
    end
  end

  def self.down
    change_table :readings do |t|
      t.change :taken_on, :date
    end
  end
end
