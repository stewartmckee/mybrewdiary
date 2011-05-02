module BrewingsHelper

  def date_in_words(date)
    words = ""
    words += "in " if date > DateTime.now
    words += time_ago_in_words(date).strip
    words += " ago" if date < DateTime.now
    words
  end
  
end
