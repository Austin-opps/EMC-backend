User.delete_all
user1 = User.create(name: "John Doe", email: "john.doe@example.com",profile_picture:"hhFDGIUYQFD", password: "password",password_confirmation: "password")
user2 = User.create(name: "Jane Smith", email: "jane.smith@example.com",profile_picture:"hhFDGIUYQFD", password: "password",password_confirmation: "password")

# Seed data for products
# db/seeds.rb

# Clear existing data to avoid duplication when re-seeding
Product.delete_all

# Seed data for products
puts 'Seeding products...'
product1 = Product.create(name: "Iphone 13", price: 600,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Best camera in the industry", category: "Electronics", quantity:50 ,admin_id: 1)
product2 = Product.create(name: "Banana", price: 2,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Enjoy your Fiber", category: "Food",  quantity:70 , admin_id: 2)


# Seed data for testmonials
testimonial1 = Testimonial.create( message: "I love this product", user_id: 1)
testimonial2 = Testimonial.create( message: "I recommend this product", user_id: 2)

puts "Database successfully seeded!"
