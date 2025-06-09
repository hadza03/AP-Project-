import { getAllProducts } from "./services/productService.js";

const waitForElement = async (selector, timeout = 5000) => {
  return new Promise((resolve, reject) => {
    const interval = setInterval(() => {
      const el = document.querySelector(selector);
      if (el) {
        clearInterval(interval);
        resolve(el);
      }
    }, 100);

    setTimeout(() => {
      clearInterval(interval);
      reject("⛔ Timeout waiting for element: " + selector);
    }, timeout);
  });
};

const addToCart = (product) => {
  const cart = JSON.parse(localStorage.getItem("cart")) || [];
  const index = cart.findIndex(item => item.id === product.id);
  if (index !== -1) {
    cart[index].quantity++;
  } else {
    product.quantity = 1;
    cart.push(product);
  }
  localStorage.setItem("cart", JSON.stringify(cart));
  alert(`${product.name} added to cart!`);
};

(async () => {
  console.log("🔥 store.js loaded and running...");
  try {
    const container = await waitForElement("#product-grid");
    console.log("✅ Found #product-grid");

    const products = await getAllProducts();

    container.innerHTML = products.map(p => `
      <div class="col-md-4 col-xs-6">
        <div class="product" data-id="${p.id}" style="cursor: pointer;">
          <div class="product-img">
            <img src="/images/${p.image || 'default.jpg'}" alt="${p.name}">
            <div class="product-label">
              <span class="new">NEW</span>
            </div>
          </div>
          <div class="product-body">
            <p class="product-category">${p.category}</p>
            <h3 class="product-name">${p.name}</h3>
            <h4 class="product-price">${p.price} KM</h4>
            <p class="product-description">${p.description}</p>
            <div class="product-rating">
              <i class="fa fa-star"></i><i class="fa fa-star"></i>
              <i class="fa fa-star"></i><i class="fa fa-star"></i>
              <i class="fa fa-star-o"></i>
            </div>
            <div class="product-btns">
              <button class="add-to-wishlist"><i class="fa fa-heart-o"></i></button>
              <button class="add-to-compare"><i class="fa fa-exchange"></i></button>
              <button class="quick-view"><i class="fa fa-eye"></i></button>
            </div>
          </div>
          <div class="add-to-cart">
            <button class="add-to-cart-btn" data-id="${p.id}"><i class="fa fa-shopping-cart"></i> add to cart</button>
          </div>
        </div>
      </div>
    `).join("");

    document.querySelectorAll(".product").forEach(card => {
      card.addEventListener("click", () => {
        const id = card.getAttribute("data-id");
        localStorage.setItem("selectedProductId", id);
        loadPage("product");
      });
    });

    document.querySelectorAll(".add-to-cart-btn").forEach(button => {
      button.addEventListener("click", async (e) => {
        e.stopPropagation();
        const id = button.getAttribute("data-id");
        const product = products.find(p => p.id == id);
        if (product) addToCart(product);
      });
    });

  } catch (err) {
    console.error("❌ Error loading products:", err);
  }
})();
