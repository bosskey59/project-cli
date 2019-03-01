require "open-uri"

class Scraper
  attr_accessor :name, :designation_type, :year_designated, :url 

def cheese_scraper
  doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_European_cheeses_with_protected_geographical_status#Netherlands"))
  dutch_cheese = doc.css("table")[9]
  binding.pry
  end
end
Scraper.cheese_scraper