# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# require 'faker'

# Seed data for users

User.delete_all

user1 = User.create(name: "JohnDoe", email: "johndoe@example.com",  password_digest: "password", profile_picture: "https://i.imgur.com/5XfU5ZM.png")
user2 =User.create(name: "JaneSmith", email: "janesmith@example.com",  password_digest: "password", profile_picture: "https://i.imgur.com/5XfU5ZM.png")


# Seed data for products
# db/seeds.rb

# Clear existing data to avoid duplication when re-seeding
Product.delete_all

# Seed data for products
puts 'Seeding products...'
product1 = Product.create(name: "Iphone 13", price: 600,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Best camera in the industry", category: "Electronics", user_id: user1.id)
product2 = Product.create(name: "Banana", price: 2,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Enjoy your Fiber", category: "Food",user_id: user2)

puts "Database successfully seeded!"
