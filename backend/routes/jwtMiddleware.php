<?php
use Firebase\JWT\JWT;
use Firebase\JWT\Key;

class jwtMiddleware {

    public static function authenticate(): array {
        $headers = getallheaders();

        if (!isset($headers['Authorization'])) {
            Flight::halt(401, 'Missing Authorization header');
        }

        $token = str_replace('Bearer ', '', $headers['Authorization']);

        try {
            $decoded = JWT::decode($token, new Key(Config::JWT_SECRET(), 'HS256'));
            return (array) $decoded;
        } catch (Exception $e) {
            Flight::halt(401, 'Invalid token: ' . $e->getMessage());
            return[];
        }
    }

    public static function require_role($role) {
    $decoded = self::authenticate();

    // Pretvori u array ako nije već
    $decoded = (array) $decoded;
    $decoded['user'] = (array) $decoded['user'];

    if ($decoded['user']['role'] !== $role) {
        Flight::halt(403, "Access forbidden: requires $role role");
    }
}

}

