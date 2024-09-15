Implement an order management system where an user can place an order, the order can have various states, such as placed, shipped, etc. 

User should be able to use their form of payment method, choose an address etc. Also, basic crud functionalities for the order and various entities associated with the user.


Start_time: 1:29

Requirements -
- User should be able to add address - Done
- User should be able to add payment_methods - Done
- User should be able to create_order by choosing payment_methods and products - Done
- User should be able to pay for the order - Done
- User should be able to view order - Done


Classes

User -> id, name, email
Address -> id, user_id, info, pincode
Product -> id, name, price
PaymentMethods -> id, type, user_id
Payment -> id, order_id, payment_method_id, status
Order -> id, user_id, status, payment
Shipment -> id, order_id, address_id


Flow -

create user
create address
add address to user
seed_products
user add payment methods
choose_products from products and create_order_info
user -> place order order with qty
user make payment
successfull the order is placed/ else fails


error handling at last