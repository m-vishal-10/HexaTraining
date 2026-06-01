# Retail Sales Analytics Database

## Table Descriptions

- **customers** - store customer details
- **products** - product details
- **orders** - each order will be related to a customer
- **order_items** - items that are ordered by the customer in a specific order
- **payments** - each customers payment
- **deliveries** - delivery status of each order

---

# Table Relationships

### Customer → Orders (One-to-Many)

Each customer can place multiple orders.


- orders.customer_id → customers.customer_id


### Orders → Order Items (One-to-Many)

A single order can contain multiple items.


- order_items.order_id → orders.order_id


### Orders → Payments (One-to-One)

Each order will have a single payment.


- payments.order_id → orders.order_id


### Order Items → Products (Many-to-One)

Each ordered item is linked to a specific product.


- order_items.product_id → products.product_id


### Orders → Deliveries (One-to-One)

Each order will have a single delivery status.


- deliveries.order_id → orders.order_id


---

# Project Insights

- Total revenue = ₹1,00,629

- Highest single payment = ₹21,997 (Order 101 – Galaxy M34 + boAt)

- Electronics is the top revenue-generating category

- Aarav Sharma from Mumbai has ordered the highest number of times

- Customers Aarav, Priya, Rohan, Divya, and Karan all placed more than 1 order

- Hyderabad has the most customers (3) among all cities

- 3 orders are in Pending delivery state (106, 108, 113)
