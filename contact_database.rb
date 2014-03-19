class ContactDatabase

  def self.contacts_csv
    Contact.all = CSV.foreach("./contacts.csv") do |row|
      Contact.all << row
    end
      # file.close
    # rescue => e
    #   puts each { |e| }
  end
end