
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

require 'json'
Product.delete_all
# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), './clothes.json')
json_data = File.read(file_path)
products = JSON.parse(json_data)
#'converted'
 puts 'seeding products..............................................'
products.each do |product|
    #get the category from breadCrumbs
    cat = product["breadCrumbs"].split(",").first
    feature = product['features'].split(",").first
   
    Product.create(
        name: product['title'],
        price: product['price']['value']*100,
        image: product['thumbnailImage'],
        description: product['features'],
        category: cat,
        quantity: product['reviewsCount']
    )   
end
puts 'done products'

# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), './shoes.json')
json_data = File.read(file_path)
products = JSON.parse(json_data)
# 'converted'
 puts 'seeding shoes'
products.each do |product|
    #get the category from breadCrumbs
    cat = product["breadCrumbs"].split(",").first
    feature = product['features'].split(",").first
   
    Product.create(
        name: product['title'],
        price: product['price']['value']*100,
        image: product['thumbnailImage'],
        description: product['features'],
        category: cat,
        quantity: product['reviewsCount']
    )
    
end
puts 'done shoes'

file_path = File.join(File.dirname(__FILE__), './cologne.json')
json_data = File.read(file_path)
products = JSON.parse(json_data)
puts 'converted'
puts 'seeding cologne'

if products.present? # Check if the products array is not empty
  products.each do |product|
    # get the category from breadCrumbs
    cat = product["breadCrumbs"]&.split(",")&.first
    feature = product['features']&.split(",")&.first

    # Verify if the required data is present before creating the product
    if product['title'] && product['price'] && product['price']['value'] && product['thumbnailImage'] && cat && feature && product['reviewsCount']
      Product.create(
        name: product['title'],
        price: product['price']['value']*100,
        image: product['thumbnailImage'],
        description: feature,
        category: cat,
        quantity: product['reviewsCount']
      )
    end
  end
else
  puts "The products array is empty."
end

puts 'done cologne'

puts 'complete ////////////////////////////////////////'

