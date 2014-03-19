require_relative 'contact'
require_relative 'application'
require_relative 'contact_database'
require 'csv'


# Contact.create('Dawid', 'Spamer', 'dspamer@spamrus.com')
# Contact.create('Arthur', 'Friend', 'afriend@helpothers.com')
# Contact.create('Arthur', 'Another_Friend', 'another_friend@helpothers.com', {'mobile'=>'604-728-4912'})
ContactDatabase.contacts_csv
Application.new.run
