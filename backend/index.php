<?php
require_once __DIR__ . '/flight/Flight.php';


    // If using Composer
// OR if you're using a local copy of FlightPHP, adjust accordingly
// require_once __DIR__ . '/flight/Flight.php';

// Load route files
require_once __DIR__ . '/routes/test.php';

// Later: require_once other route files (user.php, product.php, etc.)

// Start the FlightPHP engine
Flight::start();
