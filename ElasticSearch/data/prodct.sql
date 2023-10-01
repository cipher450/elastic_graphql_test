DROP TABLE IF EXISTS `Products`;

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    description TEXT,
    price DECIMAL(10, 2),
    quantity INT,
    is_available BOOLEAN,
    date_added DATE
);

INSERT INTO Products (product_id, product_name, description, price, quantity, is_available, date_added)
VALUES
    (1, 'Laptop', '15-inch MacBook Pro', 1999.99, 10, TRUE, '2023-09-15'),
    (2, 'Smartphone', 'iPhone 13', 999.00, 25, TRUE, '2023-09-16'),
    (3, 'Headphones', 'Sony Noise Cancelling Headphones', 149.99, 50, TRUE, '2023-09-17'),
    (4, 'Tablet', 'iPad Air', 649.00, 15, TRUE, '2023-09-18'),
    (5, 'Smartwatch', 'Samsung Galaxy Watch 4', 349.00, 30, TRUE, '2023-09-19'),
    (6, 'Desktop Computer', 'HP Pavilion Gaming PC', 899.99, 8, TRUE, '2023-09-20'),
    (7, 'Camera', 'Canon EOS R6', 2399.00, 12, TRUE, '2023-09-21'),
    (8, 'TV', 'Samsung 55-inch 4K Smart TV', 799.00, 20, TRUE, '2023-09-22'),
    (9, 'Bluetooth Speaker', 'JBL Flip 5', 89.99, 40, TRUE, '2023-09-23'),
    (10, 'Gaming Console', 'PlayStation 5', 499.99, 18, TRUE, '2023-09-24'),
(11, 'Wireless Mouse', 'Logitech MX Master 3', 79.99, 60, TRUE, '2023-09-25'),
    (12, 'External Hard Drive', 'Seagate Backup Plus 2TB', 89.99, 30, TRUE, '2023-09-26'),
    (13, 'Fitness Tracker', 'Fitbit Charge 4', 129.00, 45, TRUE, '2023-09-27'),
    (14, 'Portable Charger', 'Anker PowerCore 10000', 29.99, 70, TRUE, '2023-09-28'),
    (15, 'Keyboard', 'Corsair K95 RGB Platinum', 169.99, 20, TRUE, '2023-09-29'),
    (16, 'Monitor', 'Dell 27-inch 4K UHD Monitor', 349.99, 15, TRUE, '2023-09-30'),
    (17, 'Wireless Earbuds', 'Apple AirPods Pro', 249.00, 40, TRUE, '2023-10-01'),
    (18, 'Portable Bluetooth Speaker', 'Bose SoundLink Revolve+', 199.95, 25, TRUE, '2023-10-02'),
    (19, 'Digital Camera', 'Nikon D850 DSLR', 2799.00, 8, TRUE, '2023-10-03'),
    (20, 'Printer', 'Epson WorkForce Pro WF-4740', 299.99, 12, TRUE, '2023-10-04'),
     (21, 'Gaming Mouse', 'Razer DeathAdder Elite', 69.99, 30, TRUE, '2023-10-05'),
    (22, 'Home Router', 'TP-Link Archer C4000', 179.99, 18, TRUE, '2023-10-06'),
    (23, 'Fitness Smartwatch', 'Garmin Forerunner 945', 599.00, 10, TRUE, '2023-10-07'),
    (24, 'Graphic Tablet', 'Wacom Intuos Pro', 399.99, 20, TRUE, '2023-10-08'),
    (25, 'Desk Lamp', 'Philips Hue Smart Table Lamp', 49.99, 50, TRUE, '2023-10-09'),
     (26, 'Smart Thermostat', 'Nest Learning Thermostat', 249.00, 30, TRUE, '2023-10-10'),
    (27, 'Coffee Maker', 'Keurig K-Elite Coffee Maker', 129.99, 25, TRUE, '2023-10-11'),
    (28, 'Bluetooth Headphones', 'Bose QuietComfort 35 II', 299.00, 20, TRUE, '2023-10-12'),
    (29, 'Electric Toothbrush', 'Philips Sonicare DiamondClean', 199.99, 35, TRUE, '2023-10-13'),
    (30, 'Electric Kettle', 'Hamilton Beach Electric Kettle', 24.99, 40, TRUE, '2023-10-14'),
    (31, 'Stainless Steel Water Bottle', 'Hydro Flask 32 oz', 39.95, 60, TRUE, '2023-10-15'),
    (32, 'Wireless Router', 'Netgear Nighthawk AX12', 399.99, 15, TRUE, '2023-10-16'),
    (33, 'Portable SSD', 'Samsung T5 Portable SSD 1TB', 139.99, 10, TRUE, '2023-10-17'),
    (34, 'Smart LED Bulbs', 'Philips Hue White and Color Ambiance', 49.99, 45, TRUE, '2023-10-18'),
    (35, 'External SSD', 'WD Black P50 Game Drive 2TB', 349.99, 8, TRUE, '2023-10-19'),
     (36, 'Office Chair', 'Herman Miller Aeron Chair', 1295.00, 12, TRUE, '2023-10-20'),
    (37, 'Portable Projector', 'Anker Nebula Capsule II', 599.99, 20, TRUE, '2023-10-21'),
    (38, 'Yoga Mat', 'Liforme Yoga Mat', 149.00, 30, TRUE, '2023-10-22'),
    (39, 'Wireless Charging Pad', 'Anker Wireless Charging Pad', 29.99, 50, TRUE, '2023-10-23'),
    (40, 'Digital Drawing Tablet', 'XP-Pen Artist Pro 15.6', 399.00, 15, TRUE, '2023-10-24'),
    (41, 'Noise-Canceling Earbuds', 'Sony WF-1000XM4', 279.99, 25, TRUE, '2023-10-25'),
    (42, 'Backpack', 'Osprey Atmos AG 65', 270.00, 40, TRUE, '2023-10-26'),
    (43, 'Fitness Treadmill', 'NordicTrack T Series Treadmill', 899.00, 10, TRUE, '2023-10-27'),
    (44, 'Cordless Vacuum Cleaner', 'Dyson V15 Detect', 699.99, 18, TRUE, '2023-10-28'),
    (45, 'Portable Gas Grill', 'Weber Q2200', 279.00, 15, FALSE, '2023-10-29'),
     (46, 'Home Security Camera', 'Ring Spotlight Cam', 199.99, 20, TRUE, '2023-10-30'),
    (47, 'Power Bank', 'Anker PowerCore 26800mAh', 59.99, 35, TRUE, '2023-10-31'),
    (48, 'Electric Fan', 'Dyson Pure Cool Tower Fan', 599.00, 15, TRUE, '2023-11-01'),
    (49, 'Electric Shaver', 'Braun Series 9 Electric Shaver', 299.94, 25, TRUE, '2023-11-02'),
    (50, 'Bluetooth Soundbar', 'Sonos Beam Soundbar', 399.00, 20, TRUE, '2023-11-03'),
    (51, 'Wireless Charging Stand', 'Spigen Mag Fit Designed for MagSafe Charger', 25.99, 40, TRUE, '2023-11-04'),
    (52, 'Baby Stroller', 'UPPAbaby Vista V2', 969.99, 10, FALSE, '2023-11-05'),
    (53, 'Gaming Chair', 'Secretlab Omega Series', 359.00, 15, TRUE, '2023-11-06'),
    (54, 'Electric Scooter', 'Segway Ninebot MAX G30', 799.00, 10, TRUE, '2023-11-07'),
    (55, 'Action Camera', 'GoPro HERO10 Black', 499.99, 18, TRUE, '2023-11-08'),
    (56, 'Smart Home Hub', 'Amazon Echo Show 10', 249.99, 20, FALSE, '2023-11-09'),
    (57, 'Outdoor Grill', 'Weber Genesis II E-310', 749.00, 10, TRUE, '2023-11-10'),
    (58, 'Drones', 'DJI Air 2S', 999.00, 15, TRUE, '2023-11-11'),
    (59, 'Robot Vacuum Cleaner', 'iRobot Roomba i7+', 799.99, 25, FALSE, '2023-11-12'),
    (60, 'Cordless Drill', 'DeWalt 20V MAX Cordless Drill', 129.00, 30, FALSE, '2023-11-13'),
    (61, 'Hiking Boots', 'Salomon Quest 4D 3 GTX', 229.95, 40, TRUE, '2023-11-14'),
    (62, 'Car Jump Starter', 'NOCO Boost Plus GB40', 99.95, 30, TRUE, '2023-11-15'),
    (63, 'Blender', 'Vitamix E310 Explorian Blender', 349.95, 25, TRUE, '2023-11-16'),
    (64, 'In-Ear Monitors', 'Shure SE215-CL Sound Isolating Earphones', 99.00, 50, TRUE, '2023-11-17'),
    (65, 'Wireless Router', 'Asus RT-AX88U AX6000', 299.99, 12, TRUE, '2023-11-18'),
     (66, 'Fitness Tracker', 'Fitbit Versa 3', 229.95, 30, TRUE, '2023-11-19'),
    (67, 'Slow Cooker', 'Crock-Pot 6-Quart Cook & Carry', 39.99, 25, TRUE, '2023-11-20'),
    (68, 'Wireless Keyboard and Mouse', 'Logitech MX Keys and MX Master 3', 179.99, 20, TRUE, '2023-11-21'),
    (69, 'Digital Multimeter', 'Fluke 117 Electricians True RMS Multimeter', 199.99, 15, TRUE, '2023-11-22'),
    (70, 'Wireless Earphones', 'Sennheiser Momentum True Wireless 2', 299.95, 20, TRUE, '2023-11-23'),
    (71, 'Electric Pressure Cooker', 'Instant Pot Duo Evo Plus 9-in-1', 139.95, 30, FALSE, '2023-11-24'),
    (72, 'Electric Toothbrush', 'Oral-B Pro 1000 Electric Toothbrush', 39.94, 40, TRUE, '2023-11-25'),
    (73, 'Power Strip', 'Anker PowerPort Cube', 19.99, 50, TRUE, '2023-11-26'),
    (74, 'Gaming Monitor', 'Alienware 34 Curved Gaming Monitor', 899.99, 10, TRUE, '2023-11-27'),
    (75, 'Smart Lock', 'August Smart Lock Pro', 229.99, 18, TRUE, '2023-11-28'),
    (76, 'Portable Air Conditioner', 'Black+Decker BPACT08WT Portable Air Conditioner', 329.99, 15, TRUE, '2023-11-29'),
    (77, 'Cordless Hair Dryer', 'Dyson Supersonic Hair Dryer', 399.99, 12, FALSE, '2023-11-30'),
    (78, 'External Monitor', 'Dell UltraSharp U2720Q 27-inch 4K Monitor', 549.99, 20, TRUE, '2023-12-01'),
    (79, 'Smart Plug', 'TP-Link Kasa Smart Plug', 16.99, 50, TRUE, '2023-12-02'),
    (80, 'Electric Blanket', 'Sunbeam Heated Blanket', 69.99, 30, FALSE, '2023-12-03'),
    (81, 'Wireless Gaming Mouse', 'Logitech G Pro X Superlight', 149.99, 25, TRUE, '2023-12-04'),
    (82, 'Sous Vide Machine', 'Anova Culinary Sous Vide Precision Cooker', 199.00, 18, TRUE, '2023-12-05'),
    (83, 'Powerful Blender', 'Blendtec Classic 575 Blender', 399.95, 20, TRUE, '2023-12-06'),
    (84, 'Electric Kettle', 'Breville Variable Temperature Electric Kettle', 99.95, 30, TRUE, '2023-12-07'),
    (85, 'Smart Scale', 'Withings Body+ - Smart Body Composition Wi-Fi Digital Scale', 79.95, 35, TRUE, '2023-12-08'),
     (86, 'Electric Stand Mixer', 'KitchenAid Artisan Series 5-Qt Stand Mixer', 379.00, 18, TRUE, '2023-12-09'),
    (87, 'Portable Bluetooth Speaker', 'Ultimate Ears Boom 3', 129.99, 40, TRUE, '2023-12-10'),
    (88, 'Smart Doorbell', 'Ring Video Doorbell Pro', 169.99, 22, TRUE, '2023-12-11'),
    (89, 'Portable Photo Printer', 'HP Sprocket Select Portable Instant Photo Printer', 149.99, 15, TRUE, '2023-12-12'),
    (90, 'Smart Light Switch', 'Lutron Caseta Wireless Smart Lighting Dimmer Switch', 59.95, 30, TRUE, '2023-12-13'),
    (91, 'Noise-Canceling Headphones', 'Bose Noise Cancelling Headphones 700', 379.00, 25, TRUE, '2023-12-14'),
    (92, 'Induction Cooktop', 'Duxtop Portable Induction Cooktop', 119.99, 20, TRUE, '2023-12-15'),
    (93, 'Electric Skateboard', 'Boosted Mini X Electric Skateboard', 999.00, 10, TRUE, '2023-12-16'),
    (94, 'Robotic Lawn Mower', 'Husqvarna Automower 315X', 1599.00, 12, TRUE, '2023-12-17'),
    (95, 'Car Dash Cam', 'Vantrue N2 Pro Dual Dash Cam', 199.99, 18, TRUE, '2023-12-18');
