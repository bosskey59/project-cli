require_relative "./scraper.rb"
require "pry"
class Controller
  
  def call
    puts "So I hear you like cheese."
    puts "If you would like to see a list of protected Dutch cheeses type 'list cheeses'. "
    
    
    
    
    input = gets.strip.downcase
    
    case 
    when "list cheeses"
      list_cheese
   end   
  end
  
  def list_cheeses
     Scraper.all.each.with_index(1) do |chz, i|
     puts "#{i}. #{chz.name}"
     binding.pry
    end
    puts "If you would like to order Dutch cheese type 'order cheese'. "
    puts "if you would like to learn more about a specific cheese please type that number."
    puts "if you would like to exit type 'exit'."
    
  end
  
  def good_bye
    puts "Vaarwel!"
  end
end

Controller.new.list_cheeses