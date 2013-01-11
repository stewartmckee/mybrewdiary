class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :setup_layouts
  before_filter :get_tweets
  
  def setup_layouts
    @narrow = [:welcome, :homebrew_guide, :about_us, :contact_us, :blog_posts]
  end

  PRIMARY_FERMENTATION = "PRIMARY"
  SECONDARY_FERMENTATION = "SECONDARY"
  READY = "READY"

  def get_tweets
    #unless Rails.cache.exist?('welcome#twitter')
    #  # Initialize a Twitter search
    #  Rails.cache.write('welcome#twitter', Twitter.search("#homebrew beer").reject{|t| t.retweet?}, :expires_in => 30.minutes)
    #end 
    @tweets = []# Rails.cache.read('welcome#twitter')  
  end

  def friendly_date(date, options={})
    if date > 7.days.ago.to_datetime
      # display day
      date.strftime("%A")
    elsif date.month == DateTime.now.month
      # display dom
      date.day.ordinalize
    elsif date.year == DateTime.now.year
      "#{date.day.ordinalize} #{date.strftime("%m")}"
    else
      "#{date.day.ordinalize} #{date.strftime("%m %y")}"
    end
  end

  def require_user
    true
  end
  

end
