# Bubble Tea Shop — SQL Analytics (MySQL)

A simple, beginner-friendly SQL project analyzing customer orders, drink preferences, topping usage, and revenue trends for a fictional Bubble Tea Shop.

## 📂 Files
- `schema.sql` — Create database + tables  
- `seed_data.sql` — Insert sample data  
- `analysis_queries.sql` — Analytical SQL queries  
- `README.md` — Project overview  

## 🗄️ Database Tables
- Customers  
- Drinks  
- Toppings  
- Orders  
- OrderItems  
- OrderItemToppings  

## 🚀 How to Run
1. Create schema
   ```  
   mysql -u <user> -p < schema.sql
   ```
2. Insert data
 ```
   mysql -u <user> -p bubble_tea_shop < seed_data.sql
```
3. Run queries from analysis_queries.sql.


## 📊 Key Skills Demonstrated
- Multi-table JOINs  
- GROUP BY + aggregations  
- Revenue calculations  
- Customer behavior analysis  
- Fact/dimension schema design  

## ⭐ Insights (from the dataset)
- **Milk Tea drinks** generate the most revenue and appear most frequently in orders.  
- **Tapioca Pearls** are the most commonly added topping across all items.  
- **Medium and Large sizes** contribute more to total revenue than Small sizes.  
- **Repeat customers**, especially loyalty members, account for a significant portion of orders.  
- **Peak ordering times** occur between **2 PM and 7 PM**, helpful for staffing and inventory planning.

