require_relative "./scraper.rb"
require "pry"
class Controller
  
  def call
    puts "So I hear you like cheese."
    puts "If you would like to see a list of protected Dutch cheeses type 'list cheeses'. "
    puts "If you would like to exit type 'exit'."
    
    
    
    
    input = gets.strip.downcase
    
    case 
    when "list cheeses"
      list_cheeses
    when "exit"
      good_bye
    else 
      puts "invalid input please type 'exit' or 'list cheeses'."
   end   
  end
  
  def list_cheeses
     Scraper.all.each.with_index(1) do |chz, i|
     puts "#{i}. #{chz.name} from: #{chz.place_of_origin}."
     #binding.pry
    end
    puts "If you would like to order Dutch cheese type 'order cheese'. "
    puts "if you would like to learn more about a specific cheese please type that number."
    puts "if you would like to exit type 'exit'."
   # binding.pry
    input = gets.strip.downcase
    
    case 
    when "exit"
      good_bye
    when "order cheese" 
      'open http://amsterdamcheesecompany.com/'
    end 
  end
  
  def good_bye
    puts "Vaarwel!"
  end
end
Controller.new.call