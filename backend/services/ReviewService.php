<?php
// File: services/ReviewService.php
require_once __DIR__ . '/../dao/ReviewDao.php';

class ReviewService {
    private $dao;

    public function __construct() {
        $this->dao = new ReviewDao();
    }

    public function getAllReviews() {
        return $this->dao->getAll();
    }

    public function getReviewById($id) {
        return $this->dao->getById($id);
    }

    public function addReview($review) {
        if (empty($review['user_id']) || empty($review['product_id']) || !isset($review['rating']) || empty($review['comment'])) {
            throw new Exception("User ID, product ID, rating, and comment are required.");
        }

        if (!is_numeric($review['rating']) || $review['rating'] < 1 || $review['rating'] > 5) {
            throw new Exception("Rating must be a number between 1 and 5.");
        }

        return $this->dao->insert($review);
    }

    public function updateReview($id, $review) {
        if (isset($review['rating']) && (!is_numeric($review['rating']) || $review['rating'] < 1 || $review['rating'] > 5)) {
            throw new Exception("Rating must be a number between 1 and 5.");
        }

        return $this->dao->update($id, $review);
    }

    public function deleteReview($id) {
        return $this->dao->delete($id);
    }
}
