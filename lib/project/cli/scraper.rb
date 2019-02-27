require "open-uri"

class Scraper
  doc = Nokogiri::HTML(open("http://www.spoonforkbacon.com/"))
end