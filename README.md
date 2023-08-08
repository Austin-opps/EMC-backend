# EASYMART SHOP PROJECT

Welcome to the documentation for the Online Shop project(EASYMART)! This project involves creating a web 
application for an online shop where users can browse and purchase products, manage their shopping 
carts, and leave testimonials. The project is built using the Ruby on Rails framework and utilizes a set 
of database tables managed through ActiveRecord migrations.

## INTRODUCTION
The Online Shop project is a web application that allows users to explore a variety of products, add 
them to their shopping carts, and make purchases. It also provides features such as user authentication, 
testimonials, and product galleries.

## FEATURES
Our web application includes different features that have been integrated to make shoppers experince great and fell safe when leaving their details in this application.

The features include;

⦿ User Authentication: Users can sign up, log in, and log out. Passwords are securely stored using password hashing.

⦿ Product Catalog: Users can browse products by category, view product details, and add items to their shopping carts.

⦿ Shopping Cart: Users can add and remove products from their shopping carts, and update the quantities of items.

⦿ Testimonials: Users can leave testimonials about their shopping experience.

⦿ Product Galleries: High-resolution images and thumbnails are associated with products to showcase their details.

⦿ Admin Dashboard: Administrators have access to an admin panel for managing products and user testimonials.

## SETUP
To set up the project locally, follow these steps:

1. Clone the repository: `git clone https://github.com/Austin-opps/EMC-backend.git`

2. Install dependencies: `bundle install`

3. Set up the database: `rails db:create && rails db:migrate db:seed`

4. Start the server: `rails server`

## DATABASE SCHEMA

The project's database schema consists of several tables:

⦿ Users: Store user information including name, email, password_digest, and profile picture.

⦿ Admins: Store admin information with similar fields to Users.

⦿ Testimonials: Store user testimonials associated with a specific user.

⦿ Products: Store product information including name, price, image, description, category, and quantity.

⦿ Carts: Store user cart information with references to User and Product.

⦿ Cart Items: Join table between Carts and Products.

⦿ Gallery Thumbnails: Store product gallery thumbnail images associated with a specific product.

⦿ High-Resolution Images: Store high-resolution product images associated with a specific product.

## MODELS
The project's models include:

⦿ User: Represents a user with attributes like name, email, and profile picture.

⦿ Admin: Represents an admin with similar attributes to User.

⦿ Testimonial: Represents a user testimonial associated with a specific user.

⦿ Product: Represents a product with attributes like name, price, and image.

⦿ Cart: Represents a user's shopping cart, associated with a User.

⦿ CartItem: Represents items in a user's cart, linking Cart and Product.

⦿ GalleryThumbnail: Represents a product's gallery thumbnail image.

⦿ HighResolutionImage: Represents a high-resolution product image.

## CONTROLLERS
The project includes controllers for various features:

⦿ UsersController: Handles user registration, login, and logout.

⦿ ProductsController: Manages product listings and details.

⦿ CartsController: Handles user shopping cart management.

⦿ TestimonialsController: Manages user testimonials.

⦿ AdminsController: Provides admin-specific actions such as product management.

⦿ SessionsController: Manages user login and logout sessions.

## ENDPOINTS
1. `/signup`

2. `/login`

3. `get/products`

4. `patch/product/:id`

5. `delete/products/:id`

6. `post/product`

7. `get/product:id`

8. `get/cart`
