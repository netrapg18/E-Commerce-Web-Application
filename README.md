# ShopWave — Full-Stack E-Commerce Application

A complete, production-ready e-commerce platform built with **React**, **Spring Boot**, and **MySQL**. Features JWT authentication, role-based access control, a full shopping cart and checkout flow, order tracking, and an admin dashboard with Chart.js analytics.

---

## 📁 Project Structure

```
ecommerce/
├── backend/                          # Spring Boot REST API
│   ├── src/main/java/com/ecommerce/
│   │   ├── EcommerceApplication.java # Main entry point
│   │   ├── config/                   # Security & CORS configuration
│   │   ├── controller/                # REST controllers
│   │   ├── dto/                       # Request/response DTOs
│   │   ├── entity/                    # JPA entities
│   │   ├── exception/                 # Global exception handler
│   │   ├── repository/                # Spring Data JPA repositories
│   │   ├── security/                  # JWT filter & utility
│   │   └── service/                   # Business logic
│   ├── src/main/resources/
│   │   └── application.properties     # App configuration
│   ├── pom.xml                        # Maven dependencies
│   └── .env.example                   # Environment variable template
│
├── frontend/                          # React (Vite) SPA
│   ├── src/
│   │   ├── components/
│   │   │   ├── common/                # Navbar, ProtectedRoute
│   │   │   ├── product/               # ProductCard
│   │   │   ├── order/                 # OrderStatusTracker
│   │   │   └── admin/                 # AdminLayout, modals
│   │   ├── context/                   # AuthContext, CartContext
│   │   ├── pages/                     # Route-level page components
│   │   │   └── admin/                 # Admin dashboard pages
│   │   ├── services/
│   │   │   └── api.js                 # Centralized Axios client
│   │   ├── styles/
│   │   │   └── globals.css            # Design system
│   │   ├── App.jsx                    # Router setup
│   │   └── main.jsx                   # React entry point
│   ├── index.html
│   ├── vite.config.js
│   ├── package.json
│   └── .env.example
│
└── database/
    ├── schema.sql                     # Table definitions
    └── sample_data.sql                # Seed data (admin user + 20 products)
```

---

## 🛠️ Tech Stack

| Layer          | Technology                                  |
|-----------------|----------------------------------------------|
| Frontend        | React 18, Vite, React Router v6, Axios       |
| Charts          | Chart.js + react-chartjs-2                   |
| Notifications   | react-hot-toast                               |
| Icons           | lucide-react                                  |
| Backend         | Java 17, Spring Boot 3.2, Spring Security    |
| ORM             | Spring Data JPA (Hibernate)                   |
| Database        | MySQL 8                                       |
| Auth            | JWT (jjwt) + BCrypt password hashing          |
| Build Tool      | Maven                                         |

---

## ✅ Prerequisites

Install these before starting:

1. **Java JDK 17 or higher** — [Download](https://adoptium.net/)
   ```bash
   java -version   # should show 17+
   ```
2. **Maven 3.8+** — [Download](https://maven.apache.org/download.cgi)
   ```bash
   mvn -version
   ```
3. **MySQL 8.0+** — [Download](https://dev.mysql.com/downloads/mysql/)
   ```bash
   mysql --version
   ```
4. **Node.js 18+ and npm** — [Download](https://nodejs.org/)
   ```bash
   node -v
   npm -v
   ```

---

## 🚀 Step-by-Step Installation Guide

### Step 1 — Clone / Extract the Project

Place the `ecommerce/` folder anywhere on your machine, e.g. `~/projects/ecommerce`.

### Step 2 — Set Up the MySQL Database

1. Start your MySQL server.
2. Log in to MySQL:
   ```bash
   mysql -u root -p
   ```
3. Run the schema script to create the database and tables:
   ```bash
   mysql -u root -p < database/schema.sql
   ```
4. Load sample data (creates an admin user, a demo user, and 20 products):
   ```bash
   mysql -u root -p < database/sample_data.sql
   ```
5. Verify:
   ```sql
   USE ecommerce_db;
   SHOW TABLES;
   SELECT * FROM users;
   SELECT COUNT(*) FROM products;
   ```

> **Demo accounts (after loading sample data):**
> - **Admin:** `admin@shop.com` / `Admin@123`
> - **User:** `john@example.com` / `User@123`

### Step 3 — Configure & Run the Backend

1. Navigate to the backend folder:
   ```bash
   cd backend
   ```
2. Copy the environment template and edit it with your MySQL credentials:
   ```bash
   cp .env.example .env
   ```
   Then edit `.env` (or export these as system environment variables — Spring Boot reads them via `application.properties` placeholders):
   ```env
   DB_USERNAME=root
   DB_PASSWORD=your_mysql_password
   JWT_SECRET=mySecretKeyForEcommerceAppThatIsAtLeast256BitsLong12345
   JWT_EXPIRATION=86400000
   CORS_ORIGINS=http://localhost:5173
   ```

   **How environment variables are picked up:** Spring Boot's `application.properties` uses `${DB_USERNAME:root}` syntax, meaning it will use the `DB_USERNAME` environment variable if set, otherwise fall back to `root`. The simplest options to set them:

   - **Option A (recommended for quick local testing):** Just edit the default values directly inside `src/main/resources/application.properties`.
   - **Option B (env vars, Linux/macOS):**
     ```bash
     export DB_USERNAME=root
     export DB_PASSWORD=your_mysql_password
     export JWT_SECRET=mySecretKeyForEcommerceAppThatIsAtLeast256BitsLong12345
     ```
   - **Option C (env vars, Windows PowerShell):**
     ```powershell
     $env:DB_USERNAME="root"
     $env:DB_PASSWORD="your_mysql_password"
     $env:JWT_SECRET="mySecretKeyForEcommerceAppThatIsAtLeast256BitsLong12345"
     ```

3. Build and run the Spring Boot application:
   ```bash
   mvn clean install
   mvn spring-boot:run
   ```
   Or run the packaged JAR:
   ```bash
   mvn clean package -DskipTests
   java -jar target/ecommerce-backend-1.0.0.jar
   ```

4. The backend will start on **http://localhost:8080**. On first run, Hibernate (`spring.jpa.hibernate.ddl-auto=update`) will sync the schema automatically if it differs from `schema.sql`.

5. Verify it's running:
   ```bash
   curl http://localhost:8080/api/products
   ```
   You should get back a JSON list of products.

### Step 4 — Configure & Run the Frontend

1. Open a **new terminal** and navigate to the frontend folder:
   ```bash
   cd frontend
   ```
2. Install dependencies:
   ```bash
   npm install
   ```
3. (Optional) Copy the env template:
   ```bash
   cp .env.example .env
   ```
   The default proxy configuration in `vite.config.js` already forwards `/api` requests to `http://localhost:8080`, so no changes are required for local development.

4. Start the development server:
   ```bash
   npm run dev
   ```
5. Open your browser at **http://localhost:5173**

### Step 5 — Log In and Explore

- Visit `http://localhost:5173/login`
- Log in as **admin** (`admin@shop.com` / `Admin@123`) to access `/admin` — the dashboard, product management, and order management.
- Log in as **user** (`john@example.com` / `User@123`), or register a new account, to browse products, add to cart, and place orders.

---

## ▶️ Commands Quick Reference

| Action                          | Command                                      | Run From  |
|----------------------------------|-----------------------------------------------|-----------|
| Install backend deps & build    | `mvn clean install`                           | `backend/` |
| Run backend (dev)               | `mvn spring-boot:run`                         | `backend/` |
| Build backend JAR               | `mvn clean package -DskipTests`               | `backend/` |
| Run backend JAR                | `java -jar target/ecommerce-backend-1.0.0.jar`| `backend/` |
| Install frontend deps           | `npm install`                                 | `frontend/`|
| Run frontend (dev)              | `npm run dev`                                 | `frontend/`|
| Build frontend (production)     | `npm run build`                               | `frontend/`|
| Preview production build        | `npm run preview`                             | `frontend/`|

---

## 🔑 Environment Variables Summary

### Backend (`backend/.env` or system env vars)
| Variable        | Description                                  | Default                                    |
|------------------|-----------------------------------------------|---------------------------------------------|
| `DB_USERNAME`    | MySQL username                                | `root`                                       |
| `DB_PASSWORD`    | MySQL password                                | `password`                                   |
| `JWT_SECRET`     | Secret key for signing JWTs (32+ chars)       | (see `application.properties`)               |
| `JWT_EXPIRATION` | Token validity in milliseconds                | `86400000` (24 hours)                        |
| `CORS_ORIGINS`   | Comma-separated allowed frontend origins      | `http://localhost:5173,http://localhost:3000`|

### Frontend (`frontend/.env`)
| Variable             | Description                  | Default   |
|-----------------------|-------------------------------|-----------|
| `VITE_API_BASE_URL`   | API base path (proxied)      | `/api`    |

---

## 🔐 JWT Configuration Details

- **Algorithm:** HMAC-SHA256 (HS256)
- **Token location:** Sent as `Authorization: Bearer <token>` header on every authenticated request (handled automatically by the Axios interceptor in `src/services/api.js`)
- **Storage:** Stored in `localStorage` under the `token` key after login/register
- **Expiration:** 24 hours by default (configurable via `JWT_EXPIRATION`)
- **Validation:** `JwtAuthFilter` runs on every request, extracts and validates the token, and populates the Spring Security context
- **Password hashing:** BCrypt with strength factor 10

---

## 📡 API Reference

### Authentication
| Method | Endpoint              | Access  | Description           |
|--------|------------------------|---------|------------------------|
| POST   | `/api/auth/register`  | Public  | Create a new account  |
| POST   | `/api/auth/login`     | Public  | Log in, receive JWT   |

### Products
| Method | Endpoint                | Access | Description                          |
|--------|---------------------------|--------|----------------------------------------|
| GET    | `/api/products`          | Public | List/search/filter products (`?keyword=` or `?category=`) |
| GET    | `/api/products/{id}`     | Public | Get a single product                  |
| GET    | `/api/products/categories`| Public| List distinct categories              |
| POST   | `/api/products`          | Admin  | Create a product                      |
| PUT    | `/api/products/{id}`     | Admin  | Update a product                      |
| DELETE | `/api/products/{id}`     | Admin  | Delete a product                      |

### Cart (requires authentication)
| Method | Endpoint                  | Description                |
|--------|-----------------------------|------------------------------|
| GET    | `/api/cart`                 | Get current user's cart    |
| POST   | `/api/cart/add`              | Add item (`{productId, quantity}`) |
| PUT    | `/api/cart/update`           | Update quantity (`{cartItemId, quantity}`) |
| DELETE | `/api/cart/remove/{id}`     | Remove a cart item         |

### Orders
| Method | Endpoint                       | Access | Description                      |
|--------|-----------------------------------|--------|------------------------------------|
| POST   | `/api/orders/place`              | User   | Place order from current cart     |
| GET    | `/api/orders/user`               | User   | Get logged-in user's order history|
| GET    | `/api/orders/admin`              | Admin  | Get all orders                    |
| PUT    | `/api/orders/status/{id}`        | Admin  | Update order status               |
| GET    | `/api/orders/admin/dashboard`    | Admin  | Get analytics for dashboard       |

All responses follow this envelope:
```json
{
  "success": true,
  "message": "Descriptive message",
  "data": { /* payload */ }
}
```

---

## 🗄️ Database Schema Overview

- **users** — id, name, email (unique), password (hashed), role (`USER`/`ADMIN`), timestamps
- **products** — id, name, category, description, price, stock, image_url, timestamps
- **cart** — id, user_id (FK), product_id (FK), quantity — unique on `(user_id, product_id)`
- **orders** — id, user_id (FK), total_amount, order_date, status (`PENDING`/`PROCESSING`/`SHIPPED`/`DELIVERED`/`CANCELLED`), shipping_address
- **order_items** — id, order_id (FK), product_id (FK), quantity, price (snapshot at time of order)

---

## 🧩 Key Features Implemented

- ✅ JWT authentication with BCrypt password hashing
- ✅ Role-based access control (USER / ADMIN) enforced both at the route (Spring Security) and method (`@PreAuthorize`) level
- ✅ Product browsing, search (name/category), and category filters
- ✅ Cart management with live stock validation
- ✅ Checkout with shipping address form and order placement
- ✅ Order history with a visual status tracker (Pending → Processing → Shipped → Delivered)
- ✅ Admin dashboard with Chart.js revenue line chart and order-status doughnut chart
- ✅ Admin product CRUD with modal forms and inventory view
- ✅ Admin order management with inline status updates
- ✅ Responsive design (desktop + mobile) throughout
- ✅ Form validation, loading indicators, and toast notifications across the app
- ✅ Protected routes on the frontend, enforced again on the backend

---

## 🐛 Troubleshooting

| Issue                                              | Fix                                                                 |
|------------------------------------------------------|----------------------------------------------------------------------|
| `Access denied for user 'root'@'localhost'`         | Check `DB_USERNAME`/`DB_PASSWORD` match your MySQL credentials      |
| `Unknown database 'ecommerce_db'`                   | Re-run `database/schema.sql`                                        |
| Backend starts but frontend shows network errors    | Confirm backend is running on port 8080 and CORS origin matches     |
| `401 Unauthorized` after login                      | Check that `JWT_SECRET` is at least 32 characters and consistent    |
| Port 8080 already in use                            | Change `server.port` in `application.properties`                    |
| Port 5173 already in use                            | Vite will auto-suggest another port, or set one in `vite.config.js`|

---

## 📄 License

This project was generated as a learning/reference full-stack implementation. Use freely for personal or educational projects.
