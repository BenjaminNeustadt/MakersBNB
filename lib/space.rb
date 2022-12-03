require 'pg'
require './lib/database_connection'

class Space
  # there are no unit tests for this class
#   attr_reader :name, :description, :price

#   def initialize (name:, description:, price:)
#     @name = name
#     @description = description
#     @price = price
#   end

  def self.all
    spaces = DatabaseConnection.query("SELECT * FROM spaces")
    spaces = spaces.map { |row| row.values_at('name', 'description', 'price_per_night') }
    spaces.each do |space|
      if space[2] != nil
        space[2] = Space.change_to_pounds(space[2])
      end
    end
  end

  def self.add(space_name, description, price)
    space_name = Space.double_apostrophe(space_name)
    description = Space.double_apostrophe(description)
    DatabaseConnection.query("INSERT INTO spaces (name, description, price_per_night) VALUES ('#{space_name}', '#{description}',  '#{price}');")
  end

  def self.show_most_recent_space
    spaces = DatabaseConnection.query("SELECT * FROM spaces;")
    spaces = spaces.map { |row| row.values_at('name', 'description', 'price_per_night') }.last
    if spaces[2] != nil
      spaces[2] = Space.change_to_pounds(spaces[2])
    end
    spaces
  end

  def self.names
    table = DatabaseConnection.query("SELECT * FROM spaces;")
    table.map { |row| row.values_at('name') }
  end

  # method below needed as otherwise the SQL does not process any apostrophes
  def self.double_apostrophe(description)
    chars = description.chars
    new_chars = []
    chars.each do |char|
      char = "''" if char == "'"
      new_chars << char
    end
    new_chars.join
  end

  def self.change_to_pounds(price)
    price[0] = '£'
    return price
  end

end
