# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

cards = [{ name: 'Anna', number: 123456789101110, balance: 40, cvv: 456, expiry_year: 2027, expiry_month: 12 },
  { name: 'Mathew', number: 123456789101113, balance: 0, cvv: 456, expiry_year: 2028, expiry_month: 5 },
  { name: 'John', number: 123456789101114, balance: 140, cvv: 456, expiry_year: 2026, expiry_month: 9 },
  { name: 'Cindy', number: 123456789101115, balance: 430, cvv: 456, expiry_year: 2023, expiry_month: 11 },
  { name: 'Martha', number: 123456789101116, balance: 540, cvv: 456, expiry_year: 2027, expiry_month: 3 }]

TransactionFee.create(amount: ENV['INITIAL_FEE'])

cards.each do |card_details|
  Card.create!(card_details)
end
