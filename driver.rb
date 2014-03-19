require './contact'
require 'pry'

# Create
  c = Contact.new("Dawid", "Spamer", "ds@gmail.com")
  c.save #Does an insert:)