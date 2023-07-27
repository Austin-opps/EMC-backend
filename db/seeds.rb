# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create(name: "John Doe", email: "john.doe@example.com", password: "password")
user2 = User.create(name: "Jane Smith", email: "jane.smith@example.com", password: "password")
user3 = User.create(name: "Sarah Johnson", email: "sarah.johnson@example.com", password: "password")
user4 = User.create(name: "Michael Smith", email: "michael.smith@example.com", password: "password")

# Testimonials data with user_id values matching the newly created users
testimonials_data = [
  {
    message: "Great product! It exceeded my expectations.",
    user_id: user1.id
  },
  {
    message: "Highly recommended. Will definitely use again.",
    user_id: user2.id
  },
  {
    message: "The service was excellent. I'm very satisfied.",
    user_id: user3.id
  },
  {
    message: "Outstanding quality and fast shipping!",
    user_id: user4.id
  }
  # Add more testimonials...
]

# Create testimonials in the database
testimonials_data.each do |testimonial_data|
  Testimonial.create!(testimonial_data)
end
