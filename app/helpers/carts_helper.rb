# app/helpers/carts_helper.rb

module CartsHelper
    # Add an item to the cart
    def add_to_cart(item_id, quantity)
      item = Item.find_by(id: item_id)
      return unless item
  
      if current_cart.items.include?(item)
        cart_item = current_cart.cart_items.find_by(item_id: item.id)
        cart_item.update(quantity: cart_item.quantity + quantity)
      else
        current_cart.cart_items.create(item_id: item.id, quantity: quantity)
      end
    end
  
    # Remove an item from the cart
    def remove_from_cart(item_id, quantity)
      item = Item.find_by(id: item_id)
      return unless item
  
      cart_item = current_cart.cart_items.find_by(item_id: item.id)
      return unless cart_item
  
      if cart_item.quantity <= quantity
        cart_item.destroy
      else
        cart_item.update(quantity: cart_item.quantity - quantity)
      end
    end
  
    # Empty the cart
    def empty_cart
      current_cart.cart_items.destroy_all
    end
  
    # Get the total quantity of items in the cart
    def cart_total_quantity
      current_cart.cart_items.sum(:quantity)
    end
  
    # Calculate the total price of items in the cart
    def cart_total_price
      current_cart.cart_items.sum { |cart_item| cart_item.quantity * cart_item.item.price }
    end
  
    # Check if the cart is empty
    def cart_empty?
      current_cart.cart_items.empty?
    end
  end
  