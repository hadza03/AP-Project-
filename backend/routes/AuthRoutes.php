<?php

use Firebase\JWT\JWT;
use Firebase\JWT\Key;

Flight::group('/auth', function() {

    // 🟢 REGISTER
    Flight::route('POST /register', function () {
        $data = Flight::request()->data->getData();

        $response = Flight::auth_service()->register($data);

        if ($response['success']) {
            Flight::json([
                'message' => 'User registered successfully',
                'data' => $response['data']
            ]);
        } else {
            Flight::halt(500, $response['error']);
        }
    });

    // 🔵 LOGIN
    Flight::route('POST /login', function () {
        $data = Flight::request()->data->getData();

        $response = Flight::auth_service()->login($data);

        if ($response['success']) {
            Flight::json([
                'message' => 'Login successful',
                'data' => $response['data']
            ]);
        } else {
            Flight::json([
            "error" => $response["error"]
            ], 401);    
        }
    });

    // GET CURRENT USER
    Flight::route('GET /me', function() {
    $decoded = Flight::jwt_auth();
    Flight::json([
        'message' => 'User data from token',
        'user' => $decoded['user']
    ]);
});


});
