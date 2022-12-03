require 'pg'

p "Setting up a test database..."

def setup_test_database
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec("TRUNCATE TABLE users, spaces, bookings;")
end
