module BrewingsHelper

  def date_in_words(date)
    if date > DateTime.now - 7.days
      words = ""
      words += "in " if date > DateTime.now
      words += time_ago_in_words(date).strip
      words += " ago" if date < DateTime.now
      words
    else
      "#{date.day.ordinalize} #{date.strftime("%B %Y")}"
    end
  end
  
end
