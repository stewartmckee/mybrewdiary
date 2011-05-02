class Brewing < ActiveRecord::Base

  has_many :readings
  belongs_to :user
  belongs_to :brew_type

  default_scope order("ferment_started_on ASC")
  scope :current, lambda {where("ready_on >= ?", DateTime.now)}
  scope :past, lambda {where("ready_on < ?", DateTime.now)}
  scope :for, lambda {|user| where("user_id = ?", user.id)}

end
