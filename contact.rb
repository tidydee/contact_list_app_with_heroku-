require "pry"
require 'pg'

class Contact

  attr_accessor :lname, :fname, :email, :id 

  def initialize(lname, fname, email)
    @fname =lname
    @lname = fname
    @email = email
  end

  def save
    if @id
      update
    else
      insert
    end
  end

  def insert
    # establish a connection with db
    # INSERT against the table and use @fname, @lname, etc to generate our INSERT stmt
    # Get back the ID from the record that was just inserted and save it as @id
    # return true
    connection = self.db_connection
    results = connection.exec(
        "INSERT INTO contacts (firstname, lastname, email)
         VALUES ('#{@fname}', '#{@lname}', '#{@email}')
         RETURNING id;"
      )
    @id = results[0]['id']
    connection.close
  end

  def update
    # estab a conn with db
    # UPDATE against the table and use @fname, @lname, email to Gen Update stmt
    # Get back the id from the record needing UPDATE    
  end

  ## Class Methods
  class << self

    def db_connection
      PG.connect(
      dbname: 'd30idql5uouih6',
      port: 5432,
      user: 'jsabgmnlynzrfv',
      host: 'ec2-54-221-206-165.compute-1.amazonaws.com',
      password: 'nJDvhH0p3KIMNW-w4wOIyrrVu6'
    )
    end


  end

  # ## In-memory list of contacts

  # attr_accessor :fname, :lname, :email, :id, :list, :numbers
  # @@contacts = []

  # def initialize(fname, lname, email, numbers)
  #  @fname = fname
  #  @lname = lname
  #  @email = email
  #  @numbers = numbers
  # quit
  
  # end

  # def to_s
  #   # TODO: return string representation of Contact
  #   "#{@id}: #{@fname} #{@lname} (#{@email}) #{@numbers}"  
  # end


  # ## Class Methods
  # class << self

  #   def find_by_name( contact_name )
  #     @@contact.find_all {|contact| contact.fname == contact_name } unless @@contact.nil?
  #   end

  #   def find_by_id( id )
  #     @@contact.find_all {|contact| contact.id == id } unless @@contact.nil?
  #   end

  #   def find_by_email email
  #     @@contact.find_all {|contact| contact.email == email} unless @@contact.nil?
  #   end

  #   def create(fname, lname, email, numbers = {})
  #     contact = Contact.new(fname, lname, email, numbers)
  #     @@contacts << contact
  #     return contact
  #   end

  #   def all_CSV
  #     @@contacts      
  #   end

  #   def all_CSV=(csv_file)
  #     @@contacts = csv_file
  #   end

  #   def all
  #     @@contacts
  #   end

  #   def all=(contacts)
  #     @@contact = contacts
  #   end

  #   def destroy_all
  #     @@contacts = []
  #   end
  # end

end
