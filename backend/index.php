<?php

require_once __DIR__ . '/flight/Flight.php';
require_once __DIR__ . '/../vendor/autoload.php';
require_once __DIR__ . '/routes/jwtMiddleware.php';



require_once __DIR__ . '/services/AuthService.php';
Flight::register('auth_service', 'AuthService');

require_once __DIR__ . '/routes/AuthRoutes.php';
require_once __DIR__ . '/routes/routes.php';

Flight::start();
