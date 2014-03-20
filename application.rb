require 'colorize'
require 'pry'
require './contact'

$debugging = false
$max_contacts_per_page = 100

class Application

  def run
    should_run = true
    while should_run do
      show_main_menu
      input = gets.chomp.downcase
      case input
      when "quit"
        quit
        should_run = false
      when "new"
        new_contact 
      when "list"
        list            
      when "show"
        show
      when "find"
        find
      when "update"
        update
      end
    end
  end

  private

  # Prints the main menu only
  def show_main_menu
    puts "Welcome to the best contact list managing application.".upcase.colorize( :blue )
    puts "What would you like to do next?".upcase.colorize( :green )
    puts " new      - Create a new contact.".colorize( :green )
    puts " update   - Update a contact by ID number.".colorize( :green )
    puts " list     - List all contacts.".colorize( :green )
    puts " show     - Displays contact's ID and contact details.".colorize( :green )
    puts " find     - Displays contact's name and contact details by name.".colorize( :green )
    puts " quit     - Exit Application.".colorize( :green )
    print ">> "
  end

  def update
    puts "What ID would you like to update?"
    id = gets.chomp.to_i
    Contact.update_entry(id)
  end

  def quit
    puts "Good-Bye!!".colorize( :blue )
  end

  def find
    puts "Please type the contact's first name you would like to find."
    contact_name = gets.chomp
    print_contact( Contact.find_by_name(contact_name) )
  end

  def show
    puts "Please type contact's ID."
    id = gets.chomp.to_i
    print_contact( Contact.find_by_id(id) )
  end

  def print_contact( found_contact )
     if !found_contact.nil?
      puts found_contact
    else
      puts "Could not find contact".colorize( :red )
    end
  end

def list
  Contact.list.each do |contact|
    puts contact
  end
end
  
  def new_contact
    puts "Please type contact's email address."
    email = gets.chomp
    if Contact.find_by_email(email) then
      puts ("A contact with this email already exists!").upcase.colorize( :red ) 
      puts ("Duplicated email address are not allowed.").upcase.colorize( :red )
      return
    end
    
    puts "Please type contact's first name."
    fname = gets.chomp
    puts "Please type contact's last name."
    lname = gets.chomp
    
    contact = Contact.create(fname, lname, email)
    contactString = "#{contact}".colorize(:green)
    puts "New contact #{contactString} has been added."
  end

  def add_phones
    phones = Hash.new
    if true
      puts "Please describe the phone number you'd like to add. Ex: 'mobile.'"
      user_phone_description = gets.chomp
      puts "Please enter the phone number for #{user_phone_description}:"
      phones[user_phone_description] = gets.chomp
      puts "Number added. To add another one, type 'y', to return the main screen, type 'n'."
      user_add_another_number = gets.chomp
        if user_add_another_number == "n"
          return phones
        end
    end
  end

end
