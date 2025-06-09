<?php
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
require_once 'BaseService.php';
require_once __DIR__ . '/../dao/AuthDao.php';



class AuthService extends BaseService {
    private $auth_dao;

    public function __construct() {
        $this->auth_dao = new AuthDao();
        parent::__construct($this->auth_dao);
    }

    public function get_user_by_email($email) {
        return $this->auth_dao->get_user_by_email($email);
    }

    public function register($entity) {
        if (empty($entity['username']) || empty($entity['email']) || empty($entity['password'])) {
            return ['success' => false, 'error' => 'All fields are required.'];
        }

        if (!filter_var($entity['email'], FILTER_VALIDATE_EMAIL)) {
            return ['success' => false, 'error' => 'Invalid email format.'];
        }

        if (strlen($entity['password']) < 6) {
            return ['success' => false, 'error' => 'Password must be at least 6 characters.'];
        }

        if (strlen($entity['username']) < 3) {
            return ['success' => false, 'error' => 'Username must be at least 3 characters.'];
        }

        $email_exists = $this->auth_dao->get_user_by_email($entity['email']);
        if ($email_exists) {
            return ['success' => false, 'error' => 'Email already registered.'];
        }

        $entity['password'] = password_hash($entity['password'], PASSWORD_BCRYPT);
        if (!isset($entity['role'])) $entity['role'] = 'user';

        $entity = parent::add($entity);
        unset($entity['password']);

        return ['success' => true, 'data' => $entity];
    }


    public function login($entity) {
        if (empty($entity['email']) || empty($entity['password'])) {
            return ['success' => false, 'error' => 'Email and password are required.'];
        }

        $user = $this->auth_dao->get_user_by_email($entity['email']);
        if (!$user || !password_verify($entity['password'], $user['password'])) {
            return ['success' => false, 'error' => 'Invalid username or password.'];
        }

        unset($user['password']);

        $payload = [
            'user' => $user,
            'iat' => time(),
            'exp' => time() + (60 * 60 * 24),
            'role' => $user['role']
        ];

        $token = JWT::encode($payload, Config::JWT_SECRET(), 'HS256');

        return ['success' => true, 'data' => array_merge($user, ['token' => $token])];
    }
}
