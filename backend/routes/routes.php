<?php

require_once __DIR__ . '/../routes/jwtMiddleware.php';
require_once __DIR__ . '/../services/UserService.php';
require_once __DIR__ . '/../services/ProductService.php';
require_once __DIR__ . '/../services/OrderService.php';
require_once __DIR__ . '/../services/OrderItemService.php';
require_once __DIR__ . '/../services/ReviewService.php';

// PING
Flight::route('GET /ping', function(){ echo 'pong'; });

// ----------------------- USER ROUTES -----------------------
Flight::route('GET /admin/users', function () {
    jwtMiddleware::authenticate();
    jwtMiddleware::require_role('admin');
    $users = (new UserService())->getAllUsers();
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
Flight::route('GET /products_paginated', function() {
    $limit = Flight::request()->query['limit'] ?? 9;
    $page = Flight::request()->query['page'] ?? 1;
    $offset = ($page - 1) * $limit;
    $products = (new ProductService())->getPaginated($limit, $offset);
    Flight::json($products);
});
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
Flight::route('POST /orders', function () {
    $data = json_decode(json_encode(Flight::request()->data->getData())); // stdClass
    $user = jwtMiddleware::authenticate(); // array
    $user_id = $user['user']['id']; // pristup kroz array
    $data->user_id = $user_id;

    $orderService = new OrderService();

    try {
        $order = $orderService->addOrder($data);
        Flight::json([
            'success' => true,
            'message' => 'Order placed successfully',
            'order' => $order
        ]);
    } catch (Exception $e) {
        Flight::halt(500, json_encode([
            'error' => $e->getMessage(),
            'trace' => $e->getTraceAsString()
        ]));
    }
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

// ----------------------- AUTH TEST -----------------------
Flight::route('GET /test', function () { echo "Test radi!"; });
Flight::route('GET /test/jwt', function () {
    $payload = jwtMiddleware::authenticate();
    jwtMiddleware::require_role('user');
    Flight::json(["message" => "Token validan i uloga user OK", "user" => $payload]);
});
Flight::route('GET /auth/me/admin', function () {
    $decoded = jwtMiddleware::authenticate();
    jwtMiddleware::require_role("admin");
    Flight::json(["message" => "Token validan i uloga admin OK", "user" => $decoded["user"]]);
});
