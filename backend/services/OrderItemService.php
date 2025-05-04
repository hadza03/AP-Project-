<?php
// File: services/OrderItemService.php
require_once __DIR__ . '/../dao/OrderItemDao.php';

class OrderItemService {
    private $dao;

    public function __construct() {
        $this->dao = new OrderItemDao();
    }

    public function getAllOrderItems() {
        return $this->dao->getAll();
    }

    public function getOrderItemById($id) {
        return $this->dao->getById($id);
    }

    public function addOrderItem($orderItem) {
        if (empty($orderItem['order_id']) || empty($orderItem['product_id']) || !isset($orderItem['quantity']) || !isset($orderItem['price'])) {
            throw new Exception("Order ID, product ID, quantity, and price are required.");
        }

        if (!is_numeric($orderItem['quantity']) || $orderItem['quantity'] <= 0) {
            throw new Exception("Quantity must be a positive number.");
        }

        if (!is_numeric($orderItem['price']) || $orderItem['price'] < 0) {
            throw new Exception("Price must be a non-negative number.");
        }

        return $this->dao->insert($orderItem);
    }

    public function updateOrderItem($id, $orderItem) {
        if (isset($orderItem['quantity']) && (!is_numeric($orderItem['quantity']) || $orderItem['quantity'] <= 0)) {
            throw new Exception("Quantity must be a positive number.");
        }

        if (isset($orderItem['price']) && (!is_numeric($orderItem['price']) || $orderItem['price'] < 0)) {
            throw new Exception("Price must be a non-negative number.");
        }

        return $this->dao->update($id, $orderItem);
    }

    public function deleteOrderItem($id) {
        return $this->dao->delete($id);
    }
}
