<?php
require_once __DIR__ . '/../dao/UserDao.php';

class UserService {
    private $userDao;

    public function __construct() {
        $this->userDao = new UserDao();
    }

    public function getAllUsers() {
        return $this->userDao->getAll();
    }

    public function getUserById($id) {
        return $this->userDao->getById($id);
    }

    public function addUser($user) {
        if (empty($user['username']) || empty($user['email']) || empty($user['password'])) {
            throw new Exception("Username, email, and password are required.");
        }

        if (!filter_var($user['email'], FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Invalid email format.");
        }

        $user['password'] = password_hash($user['password'], PASSWORD_DEFAULT);
        return $this->userDao->insert($user);
    }

    public function updateUser($id, $user) {
        if (!empty($user['email']) && !filter_var($user['email'], FILTER_VALIDATE_EMAIL)) {
            throw new Exception("Invalid email format.");
        }

        // Optional: Hash password if updating it
        if (!empty($user['password'])) {
            $user['password'] = password_hash($user['password'], PASSWORD_DEFAULT);
        }

        return $this->userDao->update($id, $user);
    }

    public function deleteUser($id) {
        return $this->userDao->delete($id);
    }
}
