require "open-uri"
require 'nokogiri'
require 'pry'
class Scraper
  attr_accessor :name, :url, :place_of_origin
  
  def self.cheese_array
    cheeses = []
    
    cheeses << self.cheese_scraper
  end
  

  def cheese_scraper
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/List_of_European_cheeses_with_protected_geographical_status#Netherlands"))
    dutch_cheese = doc.css("table")[9]
    first_cheese = dutch_cheese.css("tr")[2]
    
    cheese = self.new
    cheese.url = "https://en.wikipedia.org"+(first_cheese.css("a").attribute("href").value)
    cheese.name = first_cheese.css("a").attribute("title").value
    cheese.place_of_origin = first_cheese.css("a").text
    
    cheese
    binding.pry
    end
  end

Scraper.new.cheese_scraper