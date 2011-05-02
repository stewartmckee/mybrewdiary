module ApplicationHelper
  def linkify_tweet(tweet)
    
    words = tweet.split(" ")
    new_tweet = []
    words.each do |word|
      if word.starts_with?("#")
        word = link_to "<span>#{word}</span>".html_safe, "http://twitter.com/search?q=#{word[1..-1]}", :target => "_blank"
      end
      if word.starts_with?("http")
        word = link_to "<span>#{word}</span>".html_safe, word, :target => "_blank"
      end
      new_tweet << word
    end
    new_tweet.join(" ")
  end
  
  def flash_notice
    [:notice, :warn, :error].map{|type| content_tag :div, flash[type], :class => type.to_s}.join.html_safe
  end
end
