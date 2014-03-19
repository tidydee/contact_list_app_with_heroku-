require './contact'
require 'pry'

# Create
  c = Contact.new("Dawid", "Spamer", "ds@gmail.com")
  c.save #Does an insert:)


def new_contact
    puts "Please type contact's email address."
    email = gets.chomp
    email_check = Contact.find_by_email(email)

      if !email_check.nil?
        puts ("A contact with this email already exists!").upcase.colorize( :red ) 
        puts ("Duplicated email address are not allowed.").upcase.colorize( :red )
      else
        puts "Please type contact's first name."
        fname = gets.chomp
        puts "Please type contact's last name."
        lname = gets.chomp
        numbers = add_phones

        c = Contact.create(fname, lname, email, numbers)
        contactString = "#{contact}".colorize(:green)
        puts "New contact #{contactString} has been added."
      end
  end