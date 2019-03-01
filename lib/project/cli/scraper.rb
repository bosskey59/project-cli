require "open-uri"
require 'nokogiri'
require 'pry'
class Scraper
  attr_accessor :name, :url
  

  def cheese_scraper
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_European_cheeses_with_protected_geographical_status#Netherlands"))
    dutch_cheese = doc.css("table")[9]
    first_cheese = dutch_cheese.css("tr")[2]
    the_big_cheese_url = "https://en.wikipedia.org"+(first_cheese.css("a").attribute("href").value)
    the_big_cheese_name = first_cheese.css("a").attribute("title").value
    the_big_cheese_location = first_cheese.css("a").text
    binding.pry
    end
  end

Scraper.new.cheese_scraper