<?php
require_once __DIR__ . '/../dao/ProductDao.php';

class ProductService {
    private $productDao;

    public function __construct() {
        $this->productDao = new ProductDao();
    }

    public function getAllProducts() {
        return $this->productDao->getAll();
    }

    public function getProductById($id) {
        return $this->productDao->getById($id);
    }

    public function addProduct($data) {
        if (empty($data['name']) || empty($data['price']) || empty($data['category'])) {
            throw new Exception("Name, price, and category are required.");
        }

        if (!is_numeric($data['price']) || $data['price'] <= 0) {
            throw new Exception("Price must be a positive number.");
        }

        return $this->productDao->insert($data);
    }

    public function updateProduct($id, $data) {
        if (isset($data['price']) && (!is_numeric($data['price']) || $data['price'] <= 0)) {
            throw new Exception("Price must be a positive number.");
        }

        return $this->productDao->update($id, $data);
    }

    public function deleteProduct($id) {
        return $this->productDao->delete($id);
    }
}
