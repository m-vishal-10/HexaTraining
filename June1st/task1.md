customers - store customer details
products - product details 
orders - each order will be related to a customer
order items - items that are ordered by the customer in a specific order 
payments - each customers payment 
deliveries - delivery status of each order

customer -> orders (one to many) each customer can place multiple orders
`orders.customer_id` → `customers.customer_id`
orders -> order items (one to many) a single order can have multiple items
`order_items.order_id` → `orders.order_id`
orders -> payment (one to one) each order will have a single payment
`payments.order_id` → `orders.order_id`
order_items -> products (many to one) each order quantity item will have specific product
 `order_items.product_id` → `products.product_id`
order -> delivery (one to one ) each order will have a single delivery status
 `deliveries.order_id` → `orders.order_id`


Total revenue = ₹1,00,629
Highest single payment = ₹21,997 (Order 101 – Galaxy M34 + boAt)
Electronics is the top revenue-generating category

Aarav Sharma from mumbai has ordered the highest number of times
Customers Aarav, Priya, Rohan, Divya, and Karan all placed more than 1 order
Hyderabad has the most customers (3) among all cities

3 orders are in Pending delivery state (106, 108, 113)

