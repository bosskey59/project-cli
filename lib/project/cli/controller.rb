require_relative "./scraper.rb"
require "pry"
class Controller
  
  def call
    puts "So I hear you like cheese."
    puts "If you would like to see a list of protected Dutch cheeses type 'list cheeses'. "
    puts "If you would like to exit type 'exit'."
    
    
    
  loop do  
    input = gets.strip.downcase
    
    if input == "list cheeses"
      list_cheeses
    elsif input == "exit"
      good_bye
      break
    else 
      puts "invalid input please type 'exit' or 'list cheeses'."
   end   
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
   loop do
    input = gets.strip.downcase
    
    if input == 'exit' 
      good_bye
      break
    elsif input == "order cheese" 
   puts "Connecting you with the Amsterdam Cheese Company."   #'open http://amsterdamcheesecompany.com/'
   elsif input.to_i <= Scraper.all.length && input.to_i > 0 
   i = input.to_i - 1 
   url = Scraper.all[i].url
    else
      puts "Please enter valid input"
    end 
  end
end
  
  def good_bye
    puts "Vaarwel!"
  end
end
Controller.new.call