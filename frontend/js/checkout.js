// checkout.js

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

(async () => {
  await waitForElement(".order-products");

  const cart = JSON.parse(localStorage.getItem("cart")) || [];
  const orderContainer = document.querySelector(".order-products");
  const totalLabel = document.querySelector(".order-total");

  if (cart.length === 0) {
    orderContainer.innerHTML = "<p>No items in cart.</p>";
    totalLabel.textContent = "0.00 KM";
    return;
  }

  let total = 0;
  orderContainer.innerHTML = cart.map(item => {
    const itemTotal = item.price * item.quantity;
    total += itemTotal;
    return `
      <div class="order-col">
        <div>${item.quantity}x ${item.name}</div>
        <div>${itemTotal.toFixed(2)} KM</div>
      </div>
    `;
  }).join("");

  totalLabel.textContent = `${total.toFixed(2)} KM`;

  document.querySelector(".order-submit").addEventListener("click", async (e) => {
    e.preventDefault();

    const user = JSON.parse(localStorage.getItem("user"));
    if (!user || !user.token) {
      alert("You must be logged in to place an order.");
      return;
    }

    const payload = {
      user_id: user.id,
      items: cart,
      total: total
    };

    console.log("📦 Sending payload:", payload);

    try {
      const res = await fetch("http://localhost/AUDIOPROJEKT/backend/orders", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "Authorization": `Bearer ${user.token}`
        },
        body: JSON.stringify(payload)
      });

      console.log("📡 Response status:", res.status);

      const responseText = await res.text();

      let result;
      try {
        result = JSON.parse(responseText);
        console.log("✅ Parsed JSON:", result);
      } catch (e) {
        console.error("❌ Response is not JSON:", responseText);
        alert("❌ Server returned invalid JSON:\n\n" + responseText);
        return;
      }

      if (!res.ok) {
        alert("❌ Error: " + (result.error || result.message || "Unknown error"));
        return;
      }

      alert("✅ Order placed successfully!");
      localStorage.removeItem("cart");
      window.location.hash = "#store";

    } catch (err) {
      console.error("❌ Fetch error:", err);
      alert("❌ Failed to place order: " + err.message);
    }
  });
})();
