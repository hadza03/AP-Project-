<?php
require_once __DIR__ . '/../dao/OrderDao.php';

class OrderService {
    private $orderDao;

    public function __construct() {
        $this->orderDao = new OrderDao();
    }

    public function getAllOrders() {
        return $this->orderDao->getAll();
    }

    public function getOrderById($id) {
        return $this->orderDao->getById($id);
    }

    public function addOrder($data) {
        if (empty($data['user_id']) || empty($data['status']) || !isset($data['total'])) {
            throw new Exception("User ID, status, and total are required.");
        }

        if (!is_numeric($data['total']) || $data['total'] < 0) {
            throw new Exception("Total must be a non-negative number.");
        }

        return $this->orderDao->insert($data);
    }

    public function updateOrder($id, $data) {
        if (isset($data['total']) && (!is_numeric($data['total']) || $data['total'] < 0)) {
            throw new Exception("Total must be a non-negative number.");
        }

        return $this->orderDao->update($id, $data);
    }

    public function deleteOrder($id) {
        return $this->orderDao->delete($id);
    }
}
