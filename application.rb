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
        list_all_contacts            
      when "find"
        find_contact
      when "update"
        update_contact
      when "delete"
        delete_contact
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
    puts " delete   - Delete a contact by ID number.".colorize( :green )
    puts " list     - List all contacts.".colorize( :green )
    puts " find     - Search contact by first name.".colorize( :green )
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

  # def find
  #   puts "Please type the contact's first name you would like to find."
  #   contact_name = gets.chomp
  #   print_contact( Contact.find_by_name(contact_name) )
  # end

  def list_all_contacts
    Contact.all.each do |display|
      puts %/   "CONTACT: #{display.id} #{display.firstname} #{display.lastname} (#{display.email})"/.colorize( :yellow )
    end
  end
  
  def new_contact
    puts "Please type contact's email address."
    email = gets.chomp
    puts "Please type contact's first name."
    fname = gets.chomp
    puts "Please type contact's last name."
    lname = gets.chomp
    
   contact = Contact.create(:email => email, :firstname => fname, :lastname => lname )
   if Contact.email_validate == true
     contactString = "#{fname} #{lname} #{(email)}".colorize(:green)
     puts %/   
        "New contact #{contactString} has been added."
          /
   else
     puts %/   
        "A contact with the email #{email} already exists. Please use a different email address."
          /.upcase.colorize(:red)
   end
  end

  def update_contact
    puts "Which contact ID would you to update?"
    id = gets.chomp.to_i
    puts "Please type the revised email address."
    email = gets.chomp
    puts "Please type revided first name."
    fname = gets.chomp
    puts "Please type revided last name."
    lname = gets.chomp
    Contact.find(id).update(:email => email, :firstname => fname, :lastname => lname)
  end

  def delete_contact
    puts "Which contact ID would you to update?"
    id = gets.chomp.to_i
    Contact.find(id).destroy
  end

  def find_contact
    puts "Please insert contact's first name?"
    fname = gets.chomp
    contact = Contact.where("firstname = 'fname'")
    puts "#{contact.id} #{contact.firstname} #{contact.lastname} #{contact.email}" 
    # each do |find|
    #   if find        puts "#{contact.id} #{contact.firstname} #{contact.lastname} #{contact.email}" 
    #   end
  end

  # def add_phones
  #   phones = Hash.new
  #   if true
  #     puts "Please describe the phone number you'd like to add. Ex: 'mobile.'"
  #     user_phone_description = gets.chomp
  #     puts "Please enter the phone number for #{user_phone_description}:"
  #     phones[user_phone_description] = gets.chomp
  #     puts "Number added. To add another one, type 'y', to return the main screen, type 'n'."
  #     user_add_another_number = gets.chomp
  #       if user_add_another_number == "n"
  #         return phones
  #       end
  #   end
  # end

end
