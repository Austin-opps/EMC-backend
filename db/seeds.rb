Admin.delete_all
admin1 = Admin.create(name: "Austin Doe", email: "john@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password",product_id: 1)
admin2 = Admin.create(name: "Mercy Smith", email: "jane@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password",product_id: 2)

# User.destroy
user1 = User.create(name: "Kevin Wairi", email: "kevin.wairi@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password")
user2 = User.create(name: "Rose Mary", email: "rose.mary@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password")
puts user1
# Seed data for products
# db/seeds.rb

# Clear existing data to avoid duplication when re-seeding
# Product.delete_all

# Seed data for products
# puts 'Seeding products...'
# product1 = Product.create(name: "Iphone 13", price: 600,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Best camera in the industry", category: "Electronics", quantity:50 ,admin_id: 1)
# product2 = Product.create(name: "Banana", price: 2,  image: "https://i.imgur.com/5XfU5ZM.png", description: "Enjoy your Fiber", category: "Food",  quantity:70 , admin_id: 2)

# Seed data for testmonials
Testimonial.delete_all
testimonial1 = Testimonial.create(message: "I love this product", user_id: 1)
testimonial2 = Testimonial.create(message: "I recommend this product", user_id: 2)

Cart.delete_all
cart1 = Cart.create(product_id: 2, user_id: 1, quantity: 20)
cart2 = Cart.create(product_id: 3, user_id: 2, quantity: 10)

puts "Database successfully seeded!"

require "json"
Product.delete_all
# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), "./clothes.json")
json_data = File.read(file_path)
products = JSON.parse(json_data)
puts "Data"
# puts products
#'converted'
puts "seeding products.............................................."
products.each do |product|
  #get the category from breadCrumbs
  cat = product["breadCrumbs"].split(",").first
  feature = product["features"].split(",").first

  Product.create(
    name: product["title"],
    price: product["price"]["value"] * 100,
    image: product["thumbnailImage"],
    admin: admin1,
    description: product["features"],
    category: cat,
    quantity: product["reviewsCount"],
  )
end
puts "done clothes"

# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), "./shoes.json")
json_data = File.read(file_path)
products = JSON.parse(json_data)
# 'converted'
puts "seeding shoes"
products.each do |product|
  #get the category from breadCrumbs
  cat = product["breadCrumbs"].split(",").first
  feature = product["features"].split(",").first

  Product.create(
    name: product["title"],
    price: product["price"]["value"] * 100,
    image: product["thumbnailImage"],
    admin: admin1,
    description: product["features"],
    category: cat,
    quantity: product["reviewsCount"],
  )
end
puts "done shoes"

file_path = File.join(File.dirname(__FILE__), "./cologne.json")
json_data = File.read(file_path)
products = JSON.parse(json_data)
puts "seeding cologne"

if products.present? # Check if the products array is not empty
  products.each do |product|
    # get the category from breadCrumbs
    cat = product["breadCrumbs"]&.split(",")&.first
    feature = product["features"]&.split(",")&.first

    # Verify if the required data is present before creating the product
    if product["title"] && product["price"] && product["price"]["value"] && product["thumbnailImage"] && cat && feature && product["reviewsCount"]
      Product.create(
        name: product["title"],
        price: product["price"]["value"] * 100,
        image: product["thumbnailImage"],
        admin: admin1,
        description: feature,
        category: cat,
        quantity: product["reviewsCount"],

      )
    end
  end
else
  puts "The products array is empty."
end

puts "done cologne"

puts "complete ////////////////////////////////////////"
