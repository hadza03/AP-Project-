import { getProductById } from "./services/productService.js";

(async () => {
  const productId = localStorage.getItem("selectedProductId");
  if (!productId) {
    document.getElementById("content").innerHTML = "<p>Product not found.</p>";
    return;
  }

  try {
    const product = await getProductById(productId);

    document.getElementById("content").innerHTML = `
      <div class="container product-detail">
        <div class="row">
          <div class="col-md-6">
            <img src="frontend/images/${product.image || 'default.jpg'}" alt="${product.name}" class="img-fluid">
          </div>
          <div class="col-md-6">
            <h2>${product.name}</h2>
            <p><strong>Category:</strong> ${product.category}</p>
            <p><strong>Price:</strong> ${product.price} KM</p>
            <p><strong>Description:</strong></p>
            <p>${product.description}</p>
            <button class="btn btn-primary">Add to Cart</button>
          </div>
        </div>
      </div>
    `;
  } catch (err) {
    document.getElementById("content").innerHTML = `<p>Error loading product: ${err.message}</p>`;
  }
})();
