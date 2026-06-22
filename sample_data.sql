-- ============================================================
-- Sample Data for E-Commerce Application
-- ============================================================

USE ecommerce_db;

-- Admin User (password: Admin@123)
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@shop.com', '$2a$10$N9qo8uLOickgx2ZMRZoMyeIjZAgcfl7p92ldGxad68LJZdL17lhWy', 'ADMIN');

-- Regular User (password: User@123)
INSERT INTO users (name, email, password, role) VALUES
('John Doe', 'john@example.com', '$2a$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2uheWG/igi.', 'USER');

-- Products
INSERT INTO products (name, category, description, price, stock, image_url) VALUES

-- Electronics
('Apple iPhone 15 Pro', 'Electronics', 'The latest iPhone with A17 Pro chip, titanium design, 48MP camera system, and USB-C connectivity. Features ProMotion display at 120Hz.', 999.99, 50, 'https://images.unsplash.com/photo-1695048133142-1a20484d2569?w=500'),
('Samsung Galaxy S24 Ultra', 'Electronics', 'Samsung flagship with Snapdragon 8 Gen 3, 200MP camera, built-in S Pen, and 5000mAh battery.', 1199.99, 35, 'https://images.unsplash.com/photo-1610945415295-d9bbf067e59c?w=500'),
('Sony WH-1000XM5 Headphones', 'Electronics', 'Industry-leading noise cancellation headphones with 30-hour battery, multipoint connection, and premium sound quality.', 349.99, 80, 'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500'),
('MacBook Pro 14" M3', 'Electronics', 'Apple MacBook Pro with M3 chip, 14.2-inch Liquid Retina XDR display, 18GB RAM, 512GB SSD.', 1999.99, 25, 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=500'),
('iPad Air M2', 'Electronics', 'Powerful iPad with M2 chip, 10.9-inch Liquid Retina display, 5G connectivity, and all-day battery life.', 749.99, 60, 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=500'),
('Dell XPS 15 Laptop', 'Electronics', 'Premium Windows laptop with Intel Core i7, NVIDIA RTX 4060, 15.6-inch OLED display, and 1TB SSD.', 1799.99, 20, 'https://images.unsplash.com/photo-1588872657578-7efd1f1555ed?w=500'),

-- Clothing
('Nike Air Max 270', 'Clothing', 'Iconic Nike sneakers with Max Air unit for all-day comfort. Available in multiple colorways with breathable mesh upper.', 150.00, 100, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500'),
('Levi''s 501 Original Jeans', 'Clothing', 'The original straight-leg jeans. Made from 100% cotton denim, button fly, and classic 5-pocket styling.', 89.99, 150, 'https://images.unsplash.com/photo-1542272604-787c3835535d?w=500'),
('Adidas Ultraboost 23', 'Clothing', 'High-performance running shoes with Boost midsole technology, Primeknit upper, and Continental rubber outsole.', 189.99, 75, 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500'),
('The North Face Puffer Jacket', 'Clothing', 'Warm and lightweight puffer jacket with 550-fill goose down, water-resistant shell, and packable design.', 249.99, 45, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?w=500'),

-- Home & Kitchen
('Instant Pot Duo 7-in-1', 'Home & Kitchen', 'Multi-functional pressure cooker, slow cooker, rice cooker, steamer, sauté pan, yogurt maker, and food warmer. 6-quart capacity.', 89.99, 120, 'https://images.unsplash.com/photo-1585515320310-259814833e62?w=500'),
('Dyson V15 Detect Vacuum', 'Home & Kitchen', 'Cordless vacuum with laser dust detection, HEPA filtration, 60-minute runtime, and LCD screen showing real-time particle counts.', 699.99, 30, 'https://images.unsplash.com/photo-1558618666-fcd25c85cd64?w=500'),
('KitchenAid Stand Mixer', 'Home & Kitchen', 'Professional 5-quart stand mixer with 10 speed settings, tilt-head design, and includes flat beater, dough hook, and wire whip.', 449.99, 40, 'https://images.unsplash.com/photo-1556909114-f6e7ad7d3136?w=500'),
('Nespresso Vertuo Next', 'Home & Kitchen', 'Coffee and espresso maker with centrifusion technology, 5 cup sizes, WiFi connectivity, and recyclable capsule system.', 179.99, 65, 'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=500'),

-- Books
('Atomic Habits', 'Books', 'By James Clear - An easy and proven way to build good habits and break bad ones. #1 New York Times bestseller.', 16.99, 200, 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=500'),
('The Psychology of Money', 'Books', 'By Morgan Housel - Timeless lessons on wealth, greed, and happiness. A guide to better understanding your relationship with money.', 14.99, 180, 'https://images.unsplash.com/photo-1553729459-efe14ef6055d?w=500'),
('Deep Work', 'Books', 'By Cal Newport - Rules for focused success in a distracted world. Learn to cultivate deep focus to achieve peak productivity.', 15.99, 160, 'https://images.unsplash.com/photo-1507842217343-583bb7270b66?w=500'),

-- Sports & Fitness
('Yoga Mat Premium', 'Sports & Fitness', 'Extra thick 6mm non-slip yoga mat with alignment lines, carrying strap, and eco-friendly TPE material. 72" x 24".', 49.99, 90, 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=500'),
('Adjustable Dumbbells Set', 'Sports & Fitness', 'Space-saving adjustable dumbbells from 5-50 lbs per dumbbell. Quick-adjust dial system with stand included.', 299.99, 35, 'https://images.unsplash.com/photo-1526506118085-60ce8714f8c5?w=500'),
('Fitbit Charge 6', 'Sports & Fitness', 'Advanced fitness tracker with built-in GPS, heart rate monitoring, sleep tracking, 40+ exercise modes, and 7-day battery.', 159.99, 70, 'https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?w=500');
