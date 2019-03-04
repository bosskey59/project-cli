require_relative ".lib/project/cli/scraper.rb"

class Controller
  
  def call
    puts "So I hear you like cheese."
    puts "If you would like to see a list of protected Dutch cheeses type 'list cheeses'. "
    
    
    
    input = gets.strip.downcase
    
    case 
    when "list cheeses"
      list_cheese
      
  end
  
  def list_cheeses
     Scraper.all.each.with_index(1) do |chz, i|
     puts "#{i}. #{chz.name}"
  end
  end
end