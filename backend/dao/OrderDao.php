<?php
require_once 'BaseDao.php';

class OrderDao extends BaseDao {
    public function __construct() {
        parent::__construct("orders");
    }

    public function getByUserId($user_id) {
        $stmt = $this->connection->prepare("SELECT * FROM orders WHERE user_id = :user_id");
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        return $stmt->fetchAll();
    }

    public function createOrderWithItems($user_id, $total, $items) {
        try {
            $this->connection->beginTransaction();

            $stmt = $this->connection->prepare("INSERT INTO orders (user_id, total, status, created_at) VALUES (:user_id, :total, 'pending', NOW())");
            $stmt->execute(['user_id' => $user_id, 'total' => $total]);
            $order_id = $this->connection->lastInsertId();

            $itemStmt = $this->connection->prepare("INSERT INTO order_items (order_id, product_id, quantity, price, created_at) VALUES (:order_id, :product_id, :quantity, :price, NOW())");
            foreach ($items as $item) {
                $itemStmt->execute([
                    'order_id' => $order_id,
                    'product_id' => $item['id'],
                    'quantity' => $item['quantity'],
                    'price' => $item['price']
                ]);
            }

            $this->connection->commit();
            return ['order_id' => $order_id];
        } catch (Exception $e) {
            $this->connection->rollBack();
            throw $e;
        }
    }
}
