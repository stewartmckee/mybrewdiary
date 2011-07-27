class AddStateToBrewings < ActiveRecord::Migration
  def self.up
    add_column :brewings, :state, :string
    
    Brewing.all.each do |brewing|
      if brewing.bottled_on > DateTime.now
        brewing.update_attributes(:state => "PRIMARY")
      elsif brewing.ready_on > DateTime.now
        brewing.update_attributes(:state => "SECONDARY")
      else
        brewing.update_attributes(:state => "READY")
      end
    end
  end

  def self.down
    remove_column :brewings, :state
  end
end
