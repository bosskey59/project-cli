require "open-uri"
require 'nokogiri'
require 'pry'
class Scraper
  attr_accessor :name, :url, :place_of_origin
  
  def self.all
    @@cheeses
  end
  
  def cheese_array
    @@cheeses = []
    @@cheeses << cheese_scraper
  end
  

  def cheese_scraper
    @@cheeses = []
    
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_European_cheeses_with_protected_geographical_status#Netherlands"))
    dutch_cheese = doc.css("table")[9]
    i = 1
    while i < dutch_cheese.css("tr").size
    first_cheese = dutch_cheese.css("tr")[i]
    
    cheese = Scraper.new
    cheese.url = "https://en.wikipedia.org"+(first_cheese.css("a").attribute("href").value)
    cheese.name = first_cheese.css("a").attribute("title").value
    cheese.place_of_origin = first_cheese.css("a").text
    @@cheeses << cheese
    i += 1
    end
    @@cheeses
     end
  end


Scraper.new.cheese_array