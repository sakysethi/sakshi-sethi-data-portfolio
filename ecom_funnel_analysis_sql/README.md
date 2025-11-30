# 📦 E-commerce Funnel & Customer Journey Analysis (SQL-Only)

A complete SQL-only analytics project analyzing how customers move through an e-commerce website funnel — **Home → Product → Cart → Checkout → Order** — and uncovering insights about conversion, devices, traffic sources, revenue, and customer behavior.

This project demonstrates real-world SQL skills used in e-commerce analytics.

---

# 📂 Project Structure
```
ecommerce_funnel_analysis_sql/
│── sql/
│     ├── setup.sql
│     ├── ecom_funnel_analysis_queries.sql
│── README.md
```

---

# 🗂 Dataset Overview (Tables)

### customers
- customer_id  
- signup_date  
- gender  
- city  

### sessions
- session_id  
- customer_id  
- session_start  
- device_type  
- traffic_source  

### pageviews
- session_id  
- page_name (home, product, cart, checkout)  
- view_time  

### orders
- session_id  
- order_amount  
- order_time  

---

# 🎯 Business Questions Answered

### Funnel Behavior
- How many users reach each stage?
- Where do they drop off?
- What are the conversion percentages?

### Acquisition Performance
- Which traffic sources convert best?
- Which bring the highest revenue?

### Device Performance
- Mobile vs Desktop vs Tablet conversion
- Revenue by device

### Revenue Insights
- Total Revenue  
- Average Order Value (AOV)  
- Revenue by device and traffic source  

### Customer Behavior
- First-time purchase rate  
- Repeat customers  
- Time to first purchase  
- Revenue by city  

---

# 📊 1. Funnel Analysis

### Sessions reaching each stage
| Stage     | Sessions |
|-----------|----------|
| Home      | 7 |
| Product   | 6 |
| Cart      | 4 |
| Checkout  | 3 |
| Order     | 3 |

### Conversion Rates
- Home → Product: **85.71%**  
- Product → Cart: **66.67%**  
- Cart → Checkout: **75%**  
- Checkout → Order: **100%**  
- Overall Conversion: **42.86%**

---

# 📱💻 2. Device Performance

| Device   | Sessions | Orders |
|----------|----------|--------|
| Mobile   | 10       | 2 |
| Desktop  | 7        | 1 |
| Tablet   | 3        | 0 |

---

# 🚦 3. Traffic Source Performance

| Source     | Sessions | Orders | Revenue |
|------------|----------|--------|---------|
| Google     | 6        | 1 | 2599 |
| Instagram  | 4        | 1 | 1299 |
| Direct     | 3        | 1 | 999 |
| Email      | 4        | 0 | 0 |
| Organic    | 3        | 0 | 0 |

---

# 💰 4. Revenue Insights

### Total Revenue: **4897**  
### Average Order Value (AOV): **1632.33**

### Revenue by Device
- Desktop: 2599  
- Mobile: 2298  
- Tablet: 0  

### Revenue by Traffic Source
- Google: 2599  
- Instagram: 1299  
- Direct: 999  

---

# 👤 5. Customer Insights

### New vs Purchasing Customers
- Total customers: **20**  
- Customers who purchased: **3**  
- First purchase rate: **15%**

### Repeat Customers
- **0** repeat customers

### Time to First Purchase
Average: **~27 days**

| Customer | Signup Date | First Order | Days |
|----------|--------------|--------------|------|
| 1 | 2025-01-05 | 2025-02-01 | 27 |
| 3 | 2025-01-07 | 2025-02-04 | 28 |
| 4 | 2025-01-08 | 2025-02-02 | 25 |

---

# 🧠 Key SQL Skills Demonstrated

- Joins  
- Aggregations  
- CTEs  
- Funnel analysis  
- Customer lifecycle metrics  
- Revenue analytics  

---

# 📌 How to Reproduce
1. Run `setup.sql`  
2. Run `ecom_funnel_analysis_queries.sql`

---

# 🚀 Future Enhancements
- Segmentation  
- Power BI dashboard  
- Product-level funnel  
- Cohort retention  
