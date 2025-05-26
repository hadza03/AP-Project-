<?php

require_once __DIR__ . '/../routes/jwtMiddleware.php';



require_once __DIR__ . '/../services/UserService.php';
require_once __DIR__ . '/../services/ProductService.php';
require_once __DIR__ . '/../services/OrderService.php';
require_once __DIR__ . '/../services/OrderItemService.php';
require_once __DIR__ . '/../services/ReviewService.php';



// PING
Flight::route('GET /ping', function(){
    echo 'pong';
});

// ----------------------- USER ROUTES -----------------------

// Only ADMIN can access this route
Flight::route('GET /admin/users', function () {
    jwtMiddleware::authenticate();           // 1. Provjeri token
    jwtMiddleware::require_role('admin');    // 2. Provjeri ulogu

    $users = (new UserService())->getAllUsers(); // 3. Vrati sve korisnike
    Flight::json([$users]);
});




Flight::route('GET /users', fn() => Flight::json((new UserService())->getAllUsers()));
Flight::route('GET /users/@id', fn($id) => Flight::json((new UserService())->getUserById($id)));

Flight::route('POST /users', function() {
    $data = Flight::request()->data->getData();
    Flight::json((new UserService())->addUser($data));
});

Flight::route('PUT /users/@id', function($id) {
    $data = Flight::request()->data->getData();
    Flight::json((new UserService())->updateUser($id, $data));
});

Flight::route('DELETE /users/@id', function($id) {
    Flight::json((new UserService())->deleteUser($id));
});

// ----------------------- PRODUCT ROUTES -----------------------
Flight::route('GET /products', fn() => Flight::json((new ProductService())->getAllProducts()));
Flight::route('GET /products/@id', fn($id) => Flight::json((new ProductService())->getProductById($id)));

Flight::route('POST /products', function() {
    $data = Flight::request()->data->getData();
    Flight::json((new ProductService())->addProduct($data));
});

Flight::route('PUT /products/@id', function($id) {
    $data = Flight::request()->data->getData();
    Flight::json((new ProductService())->updateProduct($id, $data));
});

Flight::route('DELETE /products/@id', function($id) {
    Flight::json((new ProductService())->deleteProduct($id));
});

// ----------------------- ORDER ROUTES -----------------------
Flight::route('GET /orders', fn() => Flight::json((new OrderService())->getAllOrders()));
Flight::route('GET /orders/@id', fn($id) => Flight::json((new OrderService())->getOrderById($id)));

Flight::route('POST /orders', function() {
    $data = Flight::request()->data->getData();
    Flight::json((new OrderService())->addOrder($data));
});

Flight::route('PUT /orders/@id', function($id) {
    $data = Flight::request()->data->getData();
    Flight::json((new OrderService())->updateOrder($id, $data));
});

Flight::route('DELETE /orders/@id', function($id) {
    Flight::json((new OrderService())->deleteOrder($id));
});

// ----------------------- ORDER ITEM ROUTES -----------------------
Flight::route('GET /orderitems', fn() => Flight::json((new OrderItemService())->getAllOrderItems()));
Flight::route('GET /orderitems/@id', fn($id) => Flight::json((new OrderItemService())->getOrderItemById($id)));

Flight::route('POST /orderitems', function() {
    $data = Flight::request()->data->getData();
    Flight::json((new OrderItemService())->addOrderItem($data));
});

Flight::route('PUT /orderitems/@id', function($id) {
    $data = Flight::request()->data->getData();
    Flight::json((new OrderItemService())->updateOrderItem($id, $data));
});

Flight::route('DELETE /orderitems/@id', function($id) {
    Flight::json((new OrderItemService())->deleteOrderItem($id));
});

// ----------------------- REVIEW ROUTES -----------------------
Flight::route('GET /reviews', fn() => Flight::json((new ReviewService())->getAllReviews()));
Flight::route('GET /reviews/@id', fn($id) => Flight::json((new ReviewService())->getReviewById($id)));

Flight::route('POST /reviews', function() {
    $data = Flight::request()->data->getData();
    Flight::json((new ReviewService())->addReview($data));
});

Flight::route('PUT /reviews/@id', function($id) {
    $data = Flight::request()->data->getData();
    Flight::json((new ReviewService())->updateReview($id, $data));
});

Flight::route('DELETE /reviews/@id', function($id) {
    Flight::json((new ReviewService())->deleteReview($id));
});

Flight::route('GET /test', function () {
    echo "Test radi!";
});

Flight::route('GET /test/jwt', function () {
    $payload = jwtMiddleware::authenticate(); // provjeri token
    jwtMiddleware::require_role('user');      // provjeri ulogu

    Flight::json([
        "message" => "Token validan i uloga user OK",
        "user" => $payload
    ]);
});

Flight::route('GET /auth/me/admin', function () {
    $decoded = jwtMiddleware::authenticate();
    jwtMiddleware::require_role("admin");

    Flight::json([
        "message" => "Token validan i uloga admin OK",
        "user" => $decoded["user"]
    ]);
});


