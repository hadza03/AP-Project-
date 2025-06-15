<?php
require_once __DIR__ . '/db/Database.php';
require_once __DIR__ . '/dao/UserDao.php';
require_once __DIR__ . '/dao/ProductDao.php';
require_once __DIR__ . '/dao/OrderDao.php';
require_once __DIR__ . '/dao/OrderItemDao.php';
require_once __DIR__ . '/services/OrderService.php';

echo "=== Running Tests ===<br><br>";

// TEST 1: Dodavanje korisnika
function test_add_user() {
    $userDao = new UserDao();
    $user = [
        "username" => "testuser" . rand(100, 999),
        "email" => "testuser" . rand(100, 999) . "@mail.com",
        "password" => password_hash("test1234", PASSWORD_DEFAULT),
        "role" => "user"
    ];
    try {
        $id = $userDao->insert($user);
        echo "✅ Add User Test: " . ($id ? "PASSED (ID: $id)" : "FAILED") . "<br>";
    } catch (Exception $e) {
        echo "❌ Add User Test: FAILED - " . $e->getMessage() . "<br>";
    }
}

// TEST 2: Dohvatanje proizvoda
function test_get_products() {
    $productDao = new ProductDao();
    try {
        $products = $productDao->getAll();
        echo "✅ Get Products Test: " . (count($products) > 0 ? "PASSED" : "FAILED - No products") . "<br>";
    } catch (Exception $e) {
        echo "❌ Get Products Test: FAILED - " . $e->getMessage() . "<br>";
    }
}

// TEST 3: Dodavanje narudžbe
function test_add_order() {
    $orderService = new OrderService();
    $data = [
        "user_id" => 1, // Ensure this ID exists
        "total" => 123.45,
        "items" => [
            ["product_id" => 1, "quantity" => 2, "price" => 61.72]
        ]
    ];
    try {
        $orderService->addOrder($data);
        echo "✅ Add Order Test: PASSED<br>";
    } catch (Exception $e) {
        echo "❌ Add Order Test: FAILED - " . $e->getMessage() . "<br>";
    }
}

// Pokreni sve
test_add_user();
test_get_products();
test_add_order();

echo "<br>=== Done ===";
