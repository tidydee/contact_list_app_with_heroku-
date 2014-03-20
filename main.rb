require 'active_record'
require_relative 'contact'
require_relative 'application'

# Output messages from AR to STDOUT
# ActiveRecord::Base.logger = Logger.new(STDOUT)

puts "Establishing connection to database ..."
ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  pool: 5,
  database: 'd30idql5uouih6',
  username: 'jsabgmnlynzrfv',
  password: 'nJDvhH0p3KIMNW-w4wOIyrrVu6',
  host: 'ec2-54-221-206-165.compute-1.amazonaws.com',
  port: 5432,
  min_messages: 'error'
)
puts "CONNECTED"

Application.new.run


