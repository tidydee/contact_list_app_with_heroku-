require 'rspec'
require_relative 'contact'
require_relative 'contact_database'

describe Contact do

  before :each do 
    Contact.destroy_all
  end

  describe "initialization" do
    it "initialize should create instance var fname" do
      init = Contact.new("Dawid", "Spamer", "dawidspamer@gmail.com")
      init.fname.should eq("Dawid")
    end

    it "initialize should create instance var lname" do
      init = Contact.new("Dawid", "Spamer", "dawidspamer@gmail.com")
      init.lname.should eq("Spamer")
    end

    it "initialize should create instance var email" do
      init = Contact.new("Dawid", "Spamer", "dawidspamer@gmail.com")
      init.email.should eq("dawidspamer@gmail.com")
    end

  end

  describe "#to_s" do
    it "Over writing the 'to_s' method to display 'fname','lname','email' better." do
      new_contact = Contact.new("Pete","Tong","pt@fmail.com")
      new_contact.to_s.should eq("1: Pete Tong (pt@fmail.com)")
    end
  end

  # use . for class methods
  describe ".create" do

    it "When user inputs 'fname' it gets captured by the '@fname'" do
     contact = Contact.create("Dawid", "Spamer", "dawidspamer@gmail.com")
     contact.fname.should eq("Dawid")
    end

    it "When user inputs 'lname' it gets captured by the '@lname'" do
     contact = Contact.create("Dawid", "Spamer", "dawidspamer@gmail.com")
     contact.lname.should eq("Spamer")
    end

    it "When user inputs 'email' it gets captured by the '@email'" do
     contact = Contact.create("Dawid", "Spamer", "dawidspamer@gmail.com")
     contact.email.should eq("dawidspamer@gmail.com")
    end

    it "When user inputs 'fname' it gets captured by the '@fname'" do
     second_contact = Contact.create("Dawid", "Spamer", "dawidspamer@gmail.com")
     second_contact.fname.should eq("Dawid")
    end

    it "it check to see if Class Var @@contacts captured a instance var new_contact." do
      new_contact = Contact.create("John","Blog","jb@fmail.com")
      Contact.all.include?(new_contact).should eq(true)
    end

  end
  # use . for class methods
  describe ".find" do
    it "When user type list, it returns an uniqueID assigned to the contact in Array." do
      new_contact = Contact.create("John","Blog","jb@fmail.com")
      new_contact.id.should eq(1)
    end

  end

  # use . for class methods
  describe ".all" do

  end

end
