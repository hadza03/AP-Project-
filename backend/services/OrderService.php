<?php
require_once __DIR__ . '/../dao/OrderDao.php';
require_once __DIR__ . '/../dao/OrderItemDao.php';

class OrderService {
    private $orderDao;
    private $orderItemDao;

    public function __construct() {
        $this->orderDao = new OrderDao();
        $this->orderItemDao = new OrderItemDao();
    }

    public function getAllOrders() {
        return $this->orderDao->getAll();
    }

    public function getOrderById($id) {
        return $this->orderDao->getById($id);
    }

    public function addOrder($data) {
        if (!isset($data->user_id, $data->total, $data->items)) {
            throw new Exception("Missing order data");
        }

        $order_id = $this->orderDao->insert([
            'user_id' => $data->user_id,
            'total' => $data->total,
            'status' => 'pending'
        ]);

        foreach ($data->items as $item) {
            if (!isset($item->id, $item->quantity, $item->price)) {
                throw new Exception("Invalid item structure");
            }

            $stmt = $this->orderDao->getConnection()->prepare("
                INSERT INTO order_items (order_id, product_id, quantity, price)
                VALUES (:order_id, :product_id, :quantity, :price)
            ");
            $stmt->execute([
                ':order_id' => $order_id,
                ':product_id' => $item->id,
                ':quantity' => $item->quantity,
                ':price' => $item->price
            ]);
        }

        return ['id' => $order_id];
    }

    public function updateOrder($id, $data) {
        return $this->orderDao->update($id, $data);
    }

    public function deleteOrder($id) {
        return $this->orderDao->delete($id);
    }
}
