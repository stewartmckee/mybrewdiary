class Brewing < ActiveRecord::Base

  ajaxful_rateable :stars => 5, :allow_update => true

  has_many :readings
  belongs_to :user
  belongs_to :brew_type

  default_scope order("ferment_started_on ASC")
  scope :current, lambda {where("ready_on >= ?", DateTime.now)}
  scope :past, lambda {where("ready_on < ?", DateTime.now)}
  scope :for, lambda {|user| where("user_id = ?", user.id)}


  def estimate_bottled_on
    if self.readings.count > 4
      hourly_rate_of_change = get_rate
      change = (self.readings[0].specific_gravity - self.readings[1].specific_gravity) / ((self.readings[1].taken_on - self.readings[0].taken_on) / 60 / 60)
  
      hour = 0
      safety_valve = 0
      while change > 0 or safety_valve > 720
        hour += 1
        change = change - hourly_rate_of_change
        safety_valve += 1
      end
      self.ferment_started_on + hour.hours
    end
  end
  
  def show_state
    if state == "PRIMARY"
      "in Primary Fermentation"
    elsif state == "SECONDARY"
      "in Secondary Fermentation"
    elsif state == "READY"
      "Ready for consumption!"
    else
      nil
    end
  end

  private
  
  def get_rate
    changes = calculate_changes
    average_rate = changes.inject{ |sum, el| sum + el }.to_f / changes.size
    average_rate / ((self.readings[1].taken_on - self.readings[0].taken_on) / 60 / 60)
  end

  def calculate_changes
    last_rate = nil
    changes = (0...self.readings.count).map do |i|
      if i > 0
        last_reading = self.readings[i-1]
        reading = self.readings[i]
        hours = (reading.taken_on - last_reading.taken_on) / 60 / 60
        change = last_reading.specific_gravity - reading.specific_gravity
        rate_of_change = change / hours
        diff = last_rate - rate_of_change unless last_rate.nil?
        last_rate = rate_of_change
        diff
      end
    end
    changes.reject{|c| c.nil?}
  end
  
end
