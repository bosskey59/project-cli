require "open-uri"
require 'nokogiri'
require 'pry'
class Scraper
  

  def cheese_scraper
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_European_cheeses_with_protected_geographical_status#Netherlands"))
    dutch_cheese = doc.css("table")[9]
    first_cheese = dutch_cheese.css("tr")[1]
    binding.pry
  end
end
Scraper.new.cheese_scraper