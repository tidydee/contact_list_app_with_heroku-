require "pry"
require 'pg'

class Contact

  attr_accessor :lname, :fname, :email, :id 

  def initialize(lname, fname, email, id = nil)
    @fname =lname
    @lname = fname
    @email = email
    @id = id
  end

  def save
    if @id
      update
    else
      insert
    end
  end

  def insert
    connection = Contact.db_connection
    results = connection.exec(
        "INSERT INTO contacts (firstname, lastname, email)
         VALUES ('#{@fname}', '#{@lname}', '#{@email}')
         RETURNING id;"
      )
    @id = results[0]['id']
    connection.close
  end

  def to_s
    "#{@id}: #{@fname} #{@lname} (#{@email})"  
  end

  # ## Class Methods
  class << self
  
  def update_entry(id)
    # estab a conn with db
    # UPDATE against the table and use @fname, @lname, email to Gen Update stmt
    # Get back the id from the record needing UPDATE
    puts "What's the new name?"
    new_name = gets.chomp
    puts "What's the new last name?"
    new_last_name = gets.chomp
    puts "What's the new email?"
    new_email = gets.chomp

    connection = Contact.db_connection
    results = connection.exec(
        "UPDATE contacts SET firstname = '#{new_name}'
          ,lastname = '#{new_last_name}'
          ,email = '#{new_email}' 
         WHERE id = #{id};"
        )
    connection.close
  end

    def create(fname, lname, email)
      contact = Contact.new(fname, lname, email)
      contact.save #Does an insert:)
      return contact
    end
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

    def list(page = 0)
      offset = page * $max_contacts_per_page
      contacts = []
      Contact.runQuery("select * from contacts OFFSET #{offset} LIMIT #{$max_contacts_per_page}").each do |result|
        contacts << Contact.from_row(result)
      end
      contacts
    end

    def find_by_email (email)
      Contact.runQuery("SELECT COUNT(email) AS count
           FROM contacts
           WHERE email LIKE '%#{email}%'").getvalue(0,0).to_i > 0
    end
end

  private

  def self.from_row(row)
    Contact.new(row["lastname"], row["firstname"], row["email"], row["id"])
  end

  def self.runQuery(query)
    puts query if $debugging
    Contact.db_connection.exec(query)
  end

end
  