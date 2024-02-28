# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Delete users and cards"
Card.destroy_all
User.destroy_all
puts "Create users"

utilisateur = User.create(username: 'utilisateur1', email: 'utilisateur1@example.com', password: 'motdepasse1')
utilisateur_second = User.create(username: 'utilisateur2', email: 'utilisateur2@example.com', password: 'motdepasse2')
utilisateur_trois = User.create(username: 'utilisateur3', email: 'utilisateur3@example.com', password: 'motdepasse3')

puts "Create cards"
Card.create!(
  name: 'Card 1',
  description: 'Description of Card 1',
  image: 'https://fr.shopping.rakuten.com/photo/pikachu-v-promo-1633985847_L_NOPAD.jpg',
  state: 'Damaged', # État actif
  price: 10.99,
  user: utilisateur
)

Card.create!(
  name: 'Card 2',
  description: 'Description of Card 2',
  image: 'https://fr.shopping.rakuten.com/photo/pikachu-v-promo-1633985847_L_NOPAD.jpg',
  state: 'Mint', # État inactif
  price: 15.50,
  user: utilisateur_second
)

Card.create!(
  name: 'Card 3',
  description: 'Description of Card 3',
  image: 'https://fr.shopping.rakuten.com/photo/pikachu-v-promo-1633985847_L_NOPAD.jpg',
  state: 'Good condition', # État inactif
  price: 12.43,
  user: utilisateur_trois
)

User.create!(
  username: 'Toufic3',
  first_name: 'TTT',
  last_name: 'TTT',
  address: '3 rue du pont',
  phone_number: '06514556649',
  email: 'theo@gmail.com',
  password: 'ttttttttt'
)
