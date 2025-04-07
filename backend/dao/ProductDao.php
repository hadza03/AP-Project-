<?php
require_once 'BaseDao.php';

class ProductDao extends BaseDao {
    public function __construct() {
        parent::__construct("products");
    }

    public function getByCategory($category) {
        $stmt = $this->connection->prepare("SELECT * FROM products WHERE category = :category");
        $stmt->bindParam(':category', $category);
        $stmt->execute();
        return $stmt->fetchAll();
    }
}
?>
