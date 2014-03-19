require "pry"

class Contact

  ## In-memory list of contacts

  attr_accessor :fname, :lname, :email, :id, :list, :numbers
  @@contacts = []

  def initialize(fname, lname, email, numbers)
   @fname = fname
   @lname = lname
   @email = email
   @numbers = numbers
  quit
  
  end

  def to_s
    # TODO: return string representation of Contact
    "#{@id}: #{@fname} #{@lname} (#{@email}) #{@numbers}"  
  end


  ## Class Methods
  class << self

    def find_by_name( contact_name )
      @@contact.find_all {|contact| contact.fname == contact_name } unless @@contact.nil?
    end

    def find_by_id( id )
      @@contact.find_all {|contact| contact.id == id } unless @@contact.nil?
    end

    def find_by_email email
      @@contact.find_all {|contact| contact.email == email} unless @@contact.nil?
    end

    def create(fname, lname, email, numbers = {})
      contact = Contact.new(fname, lname, email, numbers)
      @@contacts << contact
      return contact
    end

    def all_CSV
      @@contacts      
    end

    def all_CSV=(csv_file)
      @@contacts = csv_file
    end

    def all
      @@contacts
    end

    def all=(contacts)
      @@contact = contacts
    end

    def destroy_all
      @@contacts = []
    end
  end

end
