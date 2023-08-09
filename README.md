
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
1. `POST /signup`; This is where a user creates an account for them to be able to shop.

2. `POST /login`; If a user already has an account, he/she will just be required to insert their email and name and then they will be logged back to session.

3. `get/products`; A user is able to view all the products that have been posted including their prices and description.

4. `patch/product/:id`; Admin is able to update on an existing product, either to adjust prices, name o description.

5. `delete/products/:id`; Also an admin has ability to delete a certain product. This may be due different occurences or if the item is out of stock.

6. `post/product`; AN admin has ability to create/post a product on the products list for users to be able to view new products in the market.

7. `get/product:id`; an admin and also a user is able to view one particular product. For admin he/she has more options to update or delete the product while the user is only limited to view and adding it to cart.

8. `get/cart`; The cart is purposely designated to be used by the user. a user checks items he/she placed/picked to cart, then proceeds to do final payments.

9. `DELETE /logout`; The user that has an account, after being logged into session, after doing shopping he/she proceeds to logout (delete the session) but they can login with their initial details during signup process.

10. `POST /cart`; A user is allowed to pick/select products of their choice and add them to cart.

11. `PATCH /cart`; A user may need to adjust items in the cart, either increase quantity of a product or remove a product from the cart.

12. `GET /testimonials`; A user is able to view reviews/comments/testimonials left by other users regarding a certain product.

13. `POST /testimonials`; A user is able to write how they feel about a product and post their feeling in form of a comment that will be displayed to other users.

14. `DELETE /testimonials`; A user is able to delete their comments/reviews/testimonials but they are limited to delete other users reviews.

