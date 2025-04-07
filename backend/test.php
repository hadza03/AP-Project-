<?php
require_once 'dao/UserDao.php';
require_once 'dao/ProductDao.php';
require_once 'dao/OrderDao.php';
require_once 'dao/OrderItemDao.php';
require_once 'dao/ReviewDao.php';

// DAO instances
$userDao = new UserDao();
$productDao = new ProductDao();
$orderDao = new OrderDao();
$orderItemDao = new OrderItemDao();
$reviewDao = new ReviewDao();

// Create user
$userId = $userDao->insert([
    "username" => "john",
    "email" => "john@example.com",
    "password" => password_hash("password123", PASSWORD_DEFAULT),
    "role" => "user"
]);

// Create product
$productId = $productDao->insert([
    "name" => "Bluetooth Speaker",
    "description" => "Compact and powerful speaker",
    "price" => 59.99,
    "category" => "speaker"
]);

// Create order
$orderId = $orderDao->insert([
    "user_id" => $userId,
    "status" => "pending",
    "total" => 59.99
]);

// Create order item
$orderItemDao->insert([
    "order_id" => $orderId,
    "product_id" => $productId,
    "quantity" => 1,
    "price" => 59.99
]);

// Create review
$reviewDao->insert([
    "user_id" => $userId,
    "product_id" => $productId,
    "rating" => 5,
    "comment" => "Great sound!"
]);

// Output all
echo "<pre>";
echo "USERS:\n"; print_r($userDao->getAll());
echo "PRODUCTS:\n"; print_r($productDao->getAll());
echo "ORDERS:\n"; print_r($orderDao->getAll());
echo "ORDER ITEMS:\n"; print_r($orderItemDao->getAll());
echo "REVIEWS:\n"; print_r($reviewDao->getAll());
echo "</pre>";
?>
