# Admin.delete_all
#admin1 = Admin.create(name: "Austin Doe", email: "john@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password")
#admin2 = Admin.create(name: "Mercy Smith", email: "jane@example.com",profile_picture:"hhFDGIUYQFD", password: "password", password_confirmation: "password")

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


require "json"
# Product.delete_all
# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), "./clothes.json")
json_data = File.read(file_path)
products = JSON.parse(json_data)

 puts 'seeding products 🍔 '
products.each do |product|
    #get the category from breadCrumbs
    cat = product["breadCrumbs"].split(",").first
    feature = product['features'].split(":").first
      originalString = product['title'] # remove the text Amazon from titles
      updatedTitle = originalString.gsub(/Amazon Essentials|Amazon Aware/i, " ")
      
      if !product['description'].nil?
        paragraph = product['description']
        starting_phrases_regex = /^(We listen|Amazon Essentials|Discover our|An Amazon),/
        if paragraph.match?(starting_phrases_regex)
          updated_paragraph = paragraph.gsub(starting_phrases_regex, "")
          desc = updated_paragraph
          else
          desc = product['description']
        end
        num = product['price']['value']*100
        rounded = num.round(1)
        newProduct = Product.create(
          name: updatedTitle,
          price: rounded,
          image: product['thumbnailImage'],
          description: desc,
          category: cat,
          quantity: rand(10..50)
      ) 
        product['highResolutionImages'].each do |thumbnail| 
          newProduct.highResolutionImages.create(image: thumbnail)
        end
        product['galleryThumbnails'].each do |thumbnail|
        newProduct.galleryThumbnails.create(image: thumbnail)
          end
    end
end

# 'Start seeding from JSON file'
file_path = File.join(File.dirname(__FILE__), "./shoes.json")
json_data = File.read(file_path)
products = JSON.parse(json_data)



 puts 'waiiiiit 🍞'
products.each do |product|
    #get the category from breadCrumbs
    cat = product["breadCrumbs"].split(",").first
    if product['description'].nil? #sets description
      feature = product['features'][0].split(",").first
      desc = feature
      else
      desc = product['description']
    end
    num = product['price']['value']*100
        rounded = num.round(1)
  
        newProduct = Product.create(
        name: product['title'],
        price: rounded,
        image: product['thumbnailImage'],
        description: desc,
        category: cat,
        quantity: rand(10..50),
    )
    product['highResolutionImages'].each do |thumbnail| 
      newProduct.highResolutionImages.create(image: thumbnail)
    end
    product['galleryThumbnails'].each do |thumbnail|
    newProduct.galleryThumbnails.create(image: thumbnail)
      end
  end

     puts 'almost done 🍕'

    file_path = File.join(File.dirname(__FILE__), './cologne.json')
    json_data = File.read(file_path)
    products = JSON.parse(json_data)


    products.each do |product|
    # get the category from breadCrumbs

    cat = product["breadCrumbs"].split(",").first
    if product['features'][0].nil?
      desc = product['brand']
     else
      feature = product['features'].split(",").first
      desc = feature
    end

    #Verify if the required data is present before creating the product
     if product['title'] && product['price'] && product['price']['value'] && product['thumbnailImage'] && cat && product['galleryThumbnails']
      num = product['price']['value']*100
      rounded = num.round(1)
       newProduct = Product.create(
         name: product['title'],
         price: rounded,
         image: product['thumbnailImage'],
         description: desc,
         category: cat,
         quantity: rand(10..50),
       )
      product['highResolutionImages'].each do |thumbnail| 
      newProduct.highResolutionImages.create(image: thumbnail)
      end
      product['galleryThumbnails'].each do |thumbnail|
      newProduct.galleryThumbnails.create(image: thumbnail)
      end
    end
  end

puts "Database successfully seeded! 🍻"