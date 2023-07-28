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